local Logger = require('sebaestschjin-tts.Logger')
local Utils = require('sebaestschjin-tts.Utils')
local StringUtil = require('sebaestschjin-tts.StringUtil')
local TableUtil = require('sebaestschjin-tts.TableUtil')

---@alias gh_Savefile_any gh_Savefile | gh_Savefile_v1
---@alias gh_Save_Character_any gh_Save_Character | gh_Save_v1_Character

local Savefile = {}

---@type string
local NotebookName = "Savefile"
---@type number[]
local Version = { 2, 0 }

---@return nil | gh_Savefile_any
local function readFromNotebook()
    local saveFile = Utils.readNotebook(NotebookName)
    if not saveFile or #saveFile == 0 then
        Logger.error("No notebook found containing the save file!"
                .. " Please add a notebook named %s.", NotebookName)
        return nil
    end

    local status, content = pcall(function() return JSON.decode(--[[---@not nil]] saveFile) end)
    if not status then
        Logger.error("The provided save file contains errors."
                .. " The error message from Lua is also very cryptic and doesn't really help. :-("
                .. " Make sure your save file is a valid JSON file and try again."
                .. "\n" .. content)
        return nil
    end

    return content
end

local function setDefaultValue(content, default, ...)
    local toCheck = content
    local args = table.pack(...)
    for i = 1, args.n - 1 do
        local name = args[i]
        if not toCheck[name] then
            toCheck[name] = {}
        end
        toCheck = toCheck[name]
    end

    if toCheck[args[args.n]] == nil then
        toCheck[args[args.n]] = default
    end
end

---@param content gh_Savefile_any
local function setDefaultValues(content)
    setDefaultValue(content, {}, "enhancements")

    setDefaultValue(content, {}, "unlocked", "classes")
    setDefaultValue(content, {}, "unlocked", "items")
    setDefaultValue(content, {}, "unlocked", "specialConditions")
    setDefaultValue(content, {}, "unlocked", "treasures")
    setDefaultValue(content, 0, "unlocked", "specialConditions", "donations")
    -- events?
    setDefaultValue(content, {}, "global", "achievements")
    setDefaultValue(content, {}, "global", "scenarios")
    setDefaultValue(content, 0, "global", "prosperity")

    setDefaultValue(content, "", "party", "name")
    setDefaultValue(content, "", "party", "location")
    setDefaultValue(content, {}, "party", "notes")
    setDefaultValue(content, {}, "party", "achievements")
    setDefaultValue(content, 0, "party", "reputation")
    setDefaultValue(content, {}, "party", "characters")

    for _, character in ipairs(--[[---@type gh_Save_Character_any[] ]] content.party.characters) do
        setDefaultValue(character, {}, "abilities")
        setDefaultValue(character, {}, "hand")
        setDefaultValue(character, {}, "items")
        setDefaultValue(character, {}, "perks")
        setDefaultValue(character, {}, "notes")
        setDefaultValue(character, {}, "hiddenNotes")
    end

    setDefaultValue(content, {}, "retired")

    setDefaultValue(content, {}, "events")
end

---@param saveFile gh_Savefile_any
---@return number, number
local function getVersion(saveFile)
    local metadata = saveFile.metadata
    if not metadata or not metadata.version then
        return 1, 0
    end
    local version = StringUtil.split(metadata.version, { "." })
    return --[[---@not nil]] tonumber(version[1]), --[[---@not nil]] tonumber(version[2])
end

---@param content gh_Savefile_v1
---@return gh_Savefile
local function upgradeTo2Dot0(content)
    local upgradedContent = --[[---@type gh_Savefile]] {}

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
    upgradedContent.party = --[[---@type gh_Save_Party]] {}
    upgradedContent.party.name = content.party.name
    upgradedContent.party.location = content.party.location
    upgradedContent.party.notes = content.party.notes
    upgradedContent.party.achievements = content.party.achievements
    upgradedContent.party.reputation = content.party.reputation

    local newCharacters = --[[---@type gh_Save_Character[] ]] {}
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
        version = "2.0",
        date = --[[---@type string]] os.date("%Y-%m-%d'T'%H:%M")
    }

    return upgradedContent
end

---@param savefile gh_Savefile_any
---@return gh_Savefile
local function upgrade(savefile)
    setDefaultValues(--[[---@type gh_Savefile]] savefile)

    local major, _ = getVersion(savefile)
    if major == 1 then
        savefile = upgradeTo2Dot0(--[[---@type gh_Savefile_v1]] savefile)
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
        end
    end
end

---@return nil | gh_Savefile_any
function Savefile.load()
    local saveFile = readFromNotebook()
    if saveFile then
        return upgrade(--[[---@not nil]] saveFile)
    end
    return saveFile
end

--- Creates an empty save file with tables already exisiting.
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
            specialConditions = {
                ancientTechnology = false,
                drakeAided = false,
                lowReputation = false,
                lowestReputation = false,
                highReputation = false,
                highestReputation = false,
                retired = false,
                donations = 0,
            },
        },
        metadata = {
            date = --[[---@type string]] os.date("%Y-%m-%d'T'%H:%M"),
            version = table.concat(Version, "."),
        },
    }

end

---@param saveFile gh_Savefile
function Savefile.save(saveFile)
    cleanup(saveFile)
    local jsonContent = JSON.encode_pretty(saveFile)
    jsonContent = jsonContent .. "\n" -- to conform to POSIX :-)
    Notes.addNotebookTab({ title = "New Savefile", body = jsonContent })
    printToAll("Savefile created!", "Green")
end

return Savefile