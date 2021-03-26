local EventManager = require('ge_tts.EventManager')
local Notebook = require("sebaestschjin-tts.Notebook")
local StringUtil = require("sebaestschjin-tts.StringUtil")
local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local EventType = require("gloomhaven-campaign-manager.EventType")

local Options = {}

local OptionsNotebook = "Options"

---@type boolean
Options.keepDiscardedItems = nil
---@type boolean
Options.loadExtendedBattleGoals = false

---@param savefile gh_Savefile
function Options.setup(savefile)
    EventManager.addHandler(EventType.Loaded.Start, function() Options.loadAll(savefile) end)
end

---@param savefile gh_Savefile
function Options.loadAll(savefile)
    if StringUtil.isNotEmpty(savefile.options.fantasySetup) then
        Notebook.setContent("Previous " .. OptionsNotebook, --[[---@not nil]] savefile.options.fantasySetup)
    end

    if savefile.options.keepDiscardedCards ~= nil then
        Options.keepDiscardedItems = --[[---@not nil]] savefile.options.keepDiscardedCards
    else
        Options.keepDiscardedItems = true
    end
    if savefile.options.loadExtendedBattleGoals ~= nil then
        Options.loadExtendedBattleGoals = --[[---@not nil]] savefile.options.loadExtendedBattleGoals
    else
        Options.loadExtendedBattleGoals = false
    end

    EventManager.triggerEvent(EventType.Loaded.Options)
end

---@param savefile gh_Savefile
function Options.saveAll(savefile)
    for _, notes in ipairs(Notes.getNotebookTabs()) do
        if notes.title == OptionsNotebook then
            savefile.options.fantasySetup = notes.body
        end
    end

    savefile.options.keepDiscardedCards = Options.keepDiscardedItems
    savefile.options.requirePerkFix = false
    local battleGoals = Component.battleGoalsDeck().getObjects()
    savefile.options.loadExtendedBattleGoals = TableUtil.length(battleGoals) > 24
end

return Options