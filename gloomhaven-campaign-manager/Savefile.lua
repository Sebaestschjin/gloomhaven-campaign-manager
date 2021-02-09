local Logger = require('sebaestschjin-tts.Logger')
local Utils = require('sebaestschjin-tts.Utils')

local Savefile = {}

---@type string
local NotebookName = "Savefile"
---@type number[]
local Version = { 1, 0 }

---@return nil | gh_Savefile
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

    toCheck[args[args.n]] = default
end

---@param content gh_Savefile
local function setDefaultValues(content)
    setDefaultValue(content, {}, "enhancements")

    setDefaultValue(content, {}, "unlocked", "classes")
    setDefaultValue(content, {}, "unlocked", "items")
    setDefaultValue(content, {}, "unlocked", "specialConditions")
    setDefaultValue(content, {}, "unlocked", "treasures")
    setDefaultValue(content, -1, "unlocked", "sanctuary")
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

    setDefaultValue(content, {}, "retired")
end

local function upgrade(content)
    setDefaultValues(content)
end

---@return nil | gh_Savefile
function Savefile.load()
    local saveFile = readFromNotebook()
    if saveFile then
        upgrade(saveFile)
    end
    print(logString(saveFile))
    return saveFile
end

---@param content gh_Savefile
function Savefile.save(content)
    content.metadata = {
        version = table.concat(Version, "."),
        date = os.date("%Y-%m-%d'T'%H:%M")
    }

    local jsonContent = JSON.encode_pretty(content)
    jsonContent = jsonContent .. "\n" -- to conform to POSIX :-)
    Notes.addNotebookTab({ title = "New Savefile", body = jsonContent })
end

return Savefile