local EventManager = require('ge_tts.EventManager')
local Notebook = require("sebaestschjin-tts.Notebook")
local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local EventType = require("gloomhaven-campaign-manager.EventType")

local Player = {}

---@param savefile gh_Savefile
function Player.setup(savefile)
    EventManager.addHandler(EventType.Loaded.Start, function() Player.loadAll(savefile) end)
end

---@param savefile gh_Savefile
function Player.loadAll(savefile)
    for player, content in pairs(savefile.players) do
        Notebook.setContent(player, content.notes, --[[---@type tts__PlayerColor]] player)
    end
end

---@param savefile gh_Savefile
function Player.saveAll(savefile)
    for _, notes in ipairs(Notes.getNotebookTabs()) do
        if notes.body ~= "" and TableUtil.contains(Component.PlayergColors, notes.title) then
            savefile.players[--[[---@type tts__PlayerColor]] notes.title] = { notes = notes.body }
        end
    end
end

return Player
