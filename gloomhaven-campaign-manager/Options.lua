local EventManager = require('ge_tts.EventManager')
local Notebook = require("sebaestschjin-tts.Notebook")
local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local EventType = require("gloomhaven-campaign-manager.EventType")

local Options = {}

local OptionsNotebook = "Options"

---@type boolean
Options.keepDiscardedItems = true
---@type boolean
Options.loadExtendedBattleGoals = false

---@param savefile gh_Savefile
function Options.setup(savefile)
    EventManager.addHandler(EventType.Loaded.Start, function() Options.loadAll(savefile) end)
end

---@param savefile gh_Savefile
function Options.loadAll(savefile)
    if savefile.options.fantasySetup ~= "" then
        Notebook.setContent("Previous " .. OptionsNotebook, --[[---@not nil]] savefile.options.fantasySetup)
    end

    Options.keepDiscardedItems = savefile.options.keepDiscardedCards or true
    Options.loadExtendedBattleGoals = savefile.options.loadExtendedBattleGoals or false

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

    local battleGoals = Component.battleGoalsDeck().getObjects()
    savefile.options.loadExtendedBattleGoals = TableUtil.length(battleGoals) > 24
end

return Options