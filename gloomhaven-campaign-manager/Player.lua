local EventManager = require('ge_tts.EventManager')
local Notebook = require("sebaestschjin-tts.Notebook")
local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local EventType = require("gloomhaven-campaign-manager.EventType")

local Player = {}

local GlobalPlayer = "Global"
local OptionsNotebook = "Options"

---@param savefile gh_Savefile
function Player.setup(savefile)
    EventManager.addHandler(EventType.Loaded.Start, function() Player.loadAll(savefile) end)
end

---@param savefile gh_Savefile
function Player.loadAll(savefile)
    for player, content in pairs(savefile.players) do
        if player ~= GlobalPlayer then
            Notebook.setContent(player, content.notes, --[[---@type tts__PlayerColor]] player)
        else
            Notebook.setContent("Previous " .. OptionsNotebook, content.notes)
        end
    end
end

---@param savefile gh_Savefile
function Player.saveAll(savefile)
    local players = --[[---@type gh_Save_Players ]] {}

    for _, notes in ipairs(Notes.getNotebookTabs()) do
        if notes.body ~= "" and TableUtil.contains(Component.PlayerColors, notes.title) then
            players[notes.title] = { notes = notes.body }
        elseif notes.title == OptionsNotebook then
            players[GlobalPlayer] = { notes = notes.body }
        end
    end

    savefile.players = players
end

return Player