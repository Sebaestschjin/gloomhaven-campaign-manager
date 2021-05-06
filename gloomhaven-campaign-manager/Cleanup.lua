local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local Game = require("gloomhaven-campaign-manager.Game")
local Task = require("gloomhaven-campaign-manager.Task")

local Cleanup = {}

--- total number of unlocked class events
local unlocked = 0

---@param object nil | tts__Object
local function placeIntoGamebox(object)
    if object then
        Component.gamebox().putObject(--[[---@not nil]] object)
    end
end

local function onClassUnlocked()
    unlocked = unlocked + 1
    if unlocked == TableUtil.length(Game.Classes) then
        placeIntoGamebox(Component.lockedClasses())
        unlocked = 0
    end
end

local function onTreasureLoaded()
    placeIntoGamebox(Component.treasureDeck())
end

local function setupHandler()
    Task.registerForCharacter(onClassUnlocked, Task.Event.Loaded.Class.Unlocked)
    Task.registerLoad(onTreasureLoaded, Task.Event.Loaded.Treasure)
end

setupHandler()

return Cleanup
