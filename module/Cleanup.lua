local Component = require('gloomhaven-campaign-manager.module.Component')
local Game = require('gloomhaven-campaign-manager.module.Game')

local Cleanup = {}

local unlocked = 0

function Cleanup.onClassUnlocked()
    unlocked = unlocked + 1
    if unlocked >= #Game.CLASSES then
        getObjectFromGUID(Component.guids.GAMEBOX).putObject(getObjectFromGUID(Component.guids.LOCKED_CLASSES))
    end
end

return Cleanup
