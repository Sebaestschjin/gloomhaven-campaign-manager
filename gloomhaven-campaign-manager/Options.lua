local EventManager = require('ge_tts.EventManager')
local Notebook = require("sebaestschjin-tts.Notebook")
local StringUtil = require("sebaestschjin-tts.StringUtil")

local Task = require("gloomhaven-campaign-manager.Task")

local Options = {}

local OptionsNotebook = "Options"

---@type boolean
Options.keepDiscardedItems = true
---@type boolean
Options.loadExtendedBattleGoals = false
---@type gh_Game_Difficulty
Options.difficulty = "Normal"

---@param savefile gh_Savefile
function Options.setup(savefile)
    EventManager.addHandler(Task.Event.Loaded.Start, function()
        Options.loadAll(savefile)
    end)
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

    Options.difficulty = savefile.options.difficulty or "Normal"

    EventManager.triggerEvent(Task.Event.Loaded.Options)
end

---@param savefile gh_Savefile
function Options.saveAll(savefile)
    for _, notes in ipairs(Notes.getNotebookTabs()) do
        if notes.title == OptionsNotebook then
            savefile.options.fantasySetup = notes.body
        end
    end

    savefile.options.difficulty = Options.difficulty
    savefile.options.keepDiscardedCards = Options.keepDiscardedItems
    savefile.options.requirePerkFix = false
    savefile.options.loadExtendedBattleGoals = Options.loadExtendedBattleGoals

    Task.completeSave(Task.Event.Saved.Options, savefile)
end

return Options
