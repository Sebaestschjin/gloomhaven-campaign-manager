local EventManager = require("ge_tts.EventManager")
local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local EventType = require("gloomhaven-campaign-manager.EventType")
local Game = require("gloomhaven-campaign-manager.Game")

local Cleanup = {}

--- total number of unlocked class events
local unlocked = 0

function Cleanup.setup()
    unlocked = 0
    EventManager.addHandler(EventType.Loaded.Class.Unlocked, Cleanup.onClassUnlocked)
    EventManager.addHandler(EventType.Loaded.Treasure, Cleanup.onTreasureLoaded)
end


---@param object nil | tts__Object
local function placeIntoGamebox(object)
    if object then
        Component.gamebox().putObject(--[[---@not nil]] object)
    end
end

function Cleanup.onClassUnlocked()
    unlocked = unlocked + 1
    if unlocked == TableUtil.length(Game.CLASSES) then
        placeIntoGamebox(Component.lockedClasses())
    end
end

function Cleanup.onTreasureLoaded()
    placeIntoGamebox(Component.treasureDeck())
end

return Cleanup
