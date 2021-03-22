local SaveManager = require('ge_tts.SaveManager')

local Logger = require('sebaestschjin-tts.Logger')
local Notebook = require('sebaestschjin-tts.Notebook')
local ObjectState = require('sebaestschjin-tts.ObjectState')
local StringUtil = require('sebaestschjin-tts.StringUtil')
local TableUtil = require('sebaestschjin-tts.TableUtil')

local Game = require('gloomhaven-campaign-manager.Game')

-- Aliases for latest version
---@alias gh_Savefile gh_Savefile_v3
---@alias gh_Save_Party gh_Save_Party_v3
---@alias gh_Save_Characters gh_Save_Characters_v3

---@alias gh_Savefile_any gh_Savefile | gh_Savefile_v1 | gh_Savefile_v2
---@alias gh_Save_Character_any gh_Save_Character | gh_Save_v1_Character

local Savefile = {}

---@type string
local NotebookName = "Savefile"
---@type string
local TagName = "Gloomhaven Campaign"
local IconLocation = "https://github.com/Sebaestschjin/gloomhaven-campaign-manager/raw/master/docs/save-icon.png"
---@type number[]
local Version = { 3, 0 }

---@return string
local function currentDate()
    return --[[---@type string]] os.date("%Y-%m-%d'T'%H:%M")
end

---@param savefile string
---@return nil | gh_Savefile_any
local function parseJson(savefile)
    local status, content = pcall(function() return JSON.decode(savefile) end)
    if not status then
        Logger.error("The provided save file contains errors."
                .. " The error message from Lua is also very cryptic and doesn't really help. :-("
                .. " Make sure your save file is a valid JSON file and try again."
                .. "\n" .. content)
        return nil
    end

    return content
end

---@return nil | gh_Savefile_any
local function readFromToken()
    local tokens = getObjectsWithTag(TagName)
    if TableUtil.isEmpty(tokens) then
        return nil
    end

    if TableUtil.length(tokens) > 1 then
        Logger.warn("Found more than 1 save file token! Don't know which one to use. Remove one of them and try again")
        return nil
    end

    return parseJson(tokens[1].script_state)
end

---@return nil | gh_Savefile_any
local function readFromNotebook()
    local savefile = Notebook.getContent(NotebookName)
    if not savefile or #savefile == 0 then
        return nil
    end

    return parseJson(--[[---@not nil]] savefile)
end

---@param name string
local function setDefaultValue(content, name, default)
    local toCheck = content
    local args = StringUtil.split(name, ".")
    local total = TableUtil.length(args)
    for i = 1, total - 1 do
        local n = args[i]
        if not toCheck[n] then
            toCheck[n] = {}
        end
        toCheck = toCheck[n]
    end

    if toCheck[args[total]] == nil then
        toCheck[args[total]] = default
    end
end

---@param content gh_Savefile_any
local function setDefaultValues(content)
    setDefaultValue(content, "enhancements", {})

    setDefaultValue(content, "unlocked.classes", {})
    setDefaultValue(content, "unlocked.items", {})
    setDefaultValue(content, "unlocked.specialConditions", {})
    setDefaultValue(content, "unlocked.treasures", {})
    -- events?
    setDefaultValue(content, "global.achievements", {})
    setDefaultValue(content, "global.scenarios", {})
    setDefaultValue(content, "global.prosperity", 0)

    setDefaultValue(content, "party.name", "")
    setDefaultValue(content, "party.location", "")
    setDefaultValue(content, "party.notes", {})
    setDefaultValue(content, "party.achievements", {})
    setDefaultValue(content, "party.reputation", 0)
    setDefaultValue(content, "party.characters", {})

    for _, character in pairs(--[[---@type gh_Save_Characters ]] content.party.characters) do
        setDefaultValue(character, "checkmarks", 0)
        setDefaultValue(character, "xp", 0)
        setDefaultValue(character, "gold", 0)
        setDefaultValue(character, "abilities", {})
        setDefaultValue(character, "hand", {})
        setDefaultValue(character, "items", {})
        setDefaultValue(character, "perks", {})
        setDefaultValue(character, "notes", {})
        setDefaultValue(character, "hiddenNotes", {})
    end

    setDefaultValue(content, "retired", {})

    setDefaultValue(content, "events", {})

    setDefaultValue(content, "players", {})

    setDefaultValue(content, "notes", {})

    setDefaultValue(content, "options", {})

    for _, character in pairs(--[[---@type gh_Save_Characters]] content.party.characters) do
        local class = character.class
        if not Game.class(class).isStartingClass
                and not TableUtil.contains(content.unlocked.classes, class) then
            table.insert(content.unlocked.classes, class)
        end
    end
end

---@param savefile gh_Savefile_any
---@return number, number
local function getVersion(savefile)
    local metadata = savefile.metadata
    if not metadata or not metadata.version then
        return 1, 0
    end
    local version = StringUtil.split(metadata.version, ".")
    return --[[---@not nil]] tonumber(version[1]), --[[---@not nil]] tonumber(version[2])
end

---@param content gh_Savefile_v1
---@return gh_Savefile_v2
local function upgradeToV2(content)
    local upgradedContent = --[[---@type gh_Savefile_v2]] {}

    --- enhancements
    local newEnhancements = --[[---@type gh_Save_Enhancements]] {}
    for _, enhancement in pairs(--[[---@type gh_Save_v1_EnhancedClass[] ]]content.enhancements) do
        local enhancedClass = --[[---@type gh_Save_EnhancedClass]] {}
        for _, ability in pairs(enhancement.abilities) do
            local enhancedAbility = --[[---@type gh_Save_Enhanced_Ability]] {}
            for _, abEnhancement in pairs(ability.enhancements) do
                enhancedAbility[tostring(abEnhancement.position)] = abEnhancement.enhancement
            end
            enhancedClass[ability.name] = enhancedAbility
        end
        newEnhancements[enhancement.class] = enhancedClass
    end
    upgradedContent.enhancements = newEnhancements

    --- unlocked
    upgradedContent.unlocked = content.unlocked

    --- global
    upgradedContent.global = --[[---@type gh_Save_Global]] {}
    upgradedContent.global.prosperity = content.global.prosperity

    local newScenarios = --[[---@type gh_Save_Scenarios]] {}
    for _, scenario in ipairs(--[[---@type gh_Save_v1_Scenario[] ]]content.global.scenarios) do
        newScenarios[tostring(scenario.number)] = scenario.state
    end
    upgradedContent.global.scenarios = newScenarios

    local newAchievements = --[[---@type gh_Save_Achievements]] {}
    for _, achievement in ipairs(--[[---@type gh_Save_v1_Achievement[] ]]content.global.achievements) do
        newAchievements[achievement.name] = achievement.count
    end
    upgradedContent.global.achievements = newAchievements

    --- party
    upgradedContent.party = --[[---@type gh_Save_Party_v2]] {}
    upgradedContent.party.name = content.party.name
    upgradedContent.party.location = content.party.location
    upgradedContent.party.notes = content.party.notes
    upgradedContent.party.achievements = content.party.achievements
    upgradedContent.party.reputation = content.party.reputation

    local newCharacters = --[[---@type gh_Save_Characters_v2 ]] {}
    for _, character in ipairs(--[[---@type gh_Save_v1_Character[] ]]content.party.characters) do
        local newCharacter = --[[---@type gh_Save_Character]] {}
        newCharacter.class = character.class
        newCharacter.name = character.name
        newCharacter.xp = character.xp
        newCharacter.gold = character.gold
        newCharacter.quest = character.quest
        newCharacter.checkmarks = character.checkmarks
        newCharacter.perks = character.perks
        newCharacter.abilities = character.abilities
        newCharacter.notes = character.notes
        newCharacter.hiddenNotes = character.hiddenNotes
        newCharacter.hand = character.hand

        local newItems = --[[---@type gh_Save_Character_Items]] {}
        for _, item in ipairs(character.items) do
            local itemPosition = newItems[item.position]
            if not itemPosition then
                itemPosition = {}
                newItems[item.position] = itemPosition
            end
            table.insert(itemPosition, item.name)
        end
        newCharacter.items = newItems

        table.insert(newCharacters, newCharacter)
    end
    upgradedContent.party.characters = newCharacters

    --- retired
    upgradedContent.retired = content.retired

    --- events
    local newEventDecks = --[[---@type gh_Save_EventDecks]] {}
    for _, eventDeck in ipairs(--[[---@type gh_Save_v1_EventDeck[] ]]content.events) do
        newEventDecks[eventDeck.deck] = {
            bottomUp = eventDeck.bottomUp,
            add = eventDeck.add,
            remove = eventDeck.remove,
        }
    end
    upgradedContent.events = newEventDecks

    --- metadata
    local date
    if content.metadata and content.metadata.date then
        date = content.metadata.date
    end
    upgradedContent.metadata = {
        version = "2.1",
        date = currentDate(),
    }

    return upgradedContent
end

---@param content gh_Savefile_v2
---@return gh_Savefile_v3
local function upgradeToV3(content)
    local upgradedContent = --[[---@type gh_Savefile_v3]] {}

    upgradedContent.enhancements = content.enhancements
    upgradedContent.events = content.events
    upgradedContent.global = content.global
    upgradedContent.notes = content.notes
    upgradedContent.options = content.options
    upgradedContent.players = content.players
    upgradedContent.retired = content.retired
    upgradedContent.unlocked = content.unlocked

    upgradedContent.party = --[[---@type gh_Save_Party_v3 ]] {}
    upgradedContent.party.achievements = content.party.achievements
    upgradedContent.party.location = content.party.location
    upgradedContent.party.name = content.party.name
    upgradedContent.party.notes = content.party.notes
    upgradedContent.party.reputation = content.party.reputation
    upgradedContent.party.characters = --[[---@type gh_Save_Characters_v3]] {}
    for i, character in ipairs(content.party.characters) do
        upgradedContent.party.characters[tostring(i)] = character
    end

    upgradedContent.metadata = {
        version = "3.0",
        date = currentDate(),
    }

    return upgradedContent
end

---@param savefile gh_Savefile_any
---@return gh_Savefile
local function upgrade(savefile)
    local major, _ = getVersion(savefile)
    if major == 1 then
        savefile = upgradeToV2(--[[---@type gh_Savefile_v1]] savefile)
        return upgrade(savefile)
    elseif major == 2 then
        savefile = upgradeToV3(--[[---@type gh_Savefile_v2]] savefile)
        return upgrade(savefile)
    end

    return --[[---@type gh_Savefile]] savefile
end

--- Removes empty tables from the save file reducing unnecessary noise.
---@param content table
local function cleanup(content)
    for i, v in pairs(content) do
        if type(v) == "table" then
            cleanup(v)
            if TableUtil.isEmpty(v) then
                content[i] = nil
            end
        elseif type(v) == "string" then
            if not v or v == "" then
                content[i] = nil
            end
        end
    end
end

---@return nil | gh_Savefile
function Savefile.load()
    local savefile = readFromToken()
    if not savefile then
        savefile = readFromNotebook()
    end
    if not savefile then
        Logger.error("Can not find a save file to load. Either add a notebook named %s containing the save file or " ..
                "import a token containing you save file.", NotebookName)
        return nil
    end

    setDefaultValues(--[[---@not nil]] savefile)
    local upgraded = upgrade(--[[---@not nil]] savefile)
    setDefaultValues(upgraded)
    return upgraded
end

--- Creates an empty save file with tables already existing.
---@return gh_Savefile
function Savefile.create()
    return {
        enhancements = {},
        events = {},
        global = {
            achievements = {},
            prosperity = 0,
            scenarios = {},
        },
        party = {
            name = "",
            location = "",
            achievements = {},
            characters = {},
            notes = {},
            reputation = 0,
        },
        retired = {},
        unlocked = {
            classes = {},
            treasures = {},
            items = {},
            specialConditions = {},
        },
        players = {},
        options = {},
        notes = {},
        metadata = {
            date = currentDate(),
            version = table.concat(Version, "."),
        },
    }

end

---@param obj tts__Object
function showSaveContent(obj)
    Notebook.setContent("Savefile - " .. obj.getName(), obj.script_state)
end

---@param obj tts__Object
local function addButton(obj)
    obj.createButton({
        click_function = "showSaveContent",
        function_owner = self,
        label = "Show",
        tooltip = "Show the content of the save file by creating a notebook entry.",
        position = { 0, 0.15, 0.65 },
        scale = { 1, 1, 1 },
        width = 1200,
        height = 500,
        font_size = 300,
        color = { 0.753, 0.671, 0.565, 1 },
        font_color = { 0.18, 0.047, 0.047, 1 },
    })
end

local function addButtons()
    for _, obj in ipairs(getObjectsWithTag(TagName)) do
        addButton(obj)
    end
end

---@param savefile gh_Savefile
function Savefile.save(savefile)
    cleanup(savefile)
    local jsonContent = JSON.encode_pretty(savefile)
    jsonContent = jsonContent .. "\n" -- to conform to POSIX :-)
    Notebook.setContent("New Savefile", jsonContent)

    local disc = ObjectState.token({
        image = IconLocation,
    })

    spawnObjectData({
        data = disc,
        position = { 0, 2, 0 },
        callback_function = function(obj)
            obj.script_state = jsonContent
            obj.addTag(TagName)
            obj.setName(savefile.party.name)
            obj.setDescription(savefile.metadata.date)
            addButton(obj)
        end
    })

    printToAll("Savefile created!", "Green")
end

---@param scenarioTree gh_ScenarioTree
function Savefile.saveScenarioTree(scenarioTree)
    local jsonContent = JSON.encode_pretty(scenarioTree)
    Notebook.setContent("Scenario Tree", jsonContent)
end

SaveManager.registerOnLoad(addButtons)

return Savefile
