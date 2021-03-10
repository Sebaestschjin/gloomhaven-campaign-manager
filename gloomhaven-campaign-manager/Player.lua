local EventManager = require('ge_tts.EventManager')
local Notebook = require("sebaestschjin-tts.Notebook")
local StringUtil = require("sebaestschjin-tts.StringUtil")
local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local EventType = require("gloomhaven-campaign-manager.EventType")

local Player = {}

local IgnoredNotebooks = { "Options", "Previous Options", "Quick Start Guide", "Mod Version", "Savefile", "New Savefile", "Scenario Tree" }

---@param notes tts__Notes_GetParameter
---@return boolean
local function hasContent(notes)
    return StringUtil.isNotEmpty(notes.body)
end

---@param notes tts__Notes_GetParameter
---@return boolean
local function isGlobalNotebook(notes)
    return not TableUtil.contains(IgnoredNotebooks, notes.title) and notes.color == "Grey"
end

---@param savefile gh_Savefile
function Player.setup(savefile)
    EventManager.addHandler(EventType.Loaded.Start, function() Player.loadAll(savefile) end)
end

---@param savefile gh_Savefile
function Player.loadAll(savefile)
    Player.loadPlayers(savefile)
    Player.loadNotes(savefile)
end

---@param savefile gh_Savefile
function Player.loadPlayers(savefile)
    for player, content in pairs(savefile.players) do
        local playerNotes = StringUtil.decodeBase64(content.notes)
        Notebook.setContent(player, playerNotes, --[[---@type tts__PlayerColor]] player)
    end
end

---@param savefile gh_Savefile
function Player.loadNotes(savefile)
    for _, note in ipairs(savefile.notes) do
        Notebook.addContent(note.name, note.content)
    end
end

---@param savefile gh_Savefile
function Player.saveAll(savefile)
    Player.savePlayers(savefile)
    Player.saveNotes(savefile)
end

---@param savefile gh_Savefile
function Player.savePlayers(savefile)
    for _, notes in ipairs(Notebook.getAll()) do
        if hasContent(notes) and TableUtil.contains(Component.PlayerColors, notes.title) then
            local playerNotes = StringUtil.encodeBase64(notes.body)
            savefile.players[--[[---@type tts__PlayerColor]] notes.title] = { notes = playerNotes }
        end
    end
end

---@param savefile gh_Savefile
function Player.saveNotes(savefile)
    for _, notes in ipairs(Notebook.getAll()) do
        if hasContent(notes) and isGlobalNotebook(notes) then
            table.insert(savefile.notes, { name = notes.title, content = notes.body })
        end
    end
end

return Player
