local EventManager = require("ge_tts.EventManager")
local Logger = require("sebaestschjin-tts.Logger")

local Task = {}

Task.Event = {
    Character = {
        Figurine = "character_figurine_placed",
        HpTrack = "character_hp_placed",
        Mat = "character_mat_placed",
        AttackModifiers = "attack_modifiers_placed",
        AttackModifiersPlayer = "attack_modifiers_player_placed",
    },
    Placed = {
        LockedCharacters = "locked_classes_placed",
        OpeningConditions = "opening_conditions_placed",
        Treasure = "treasure_deck_placed",
        RetirementSheet = "retirement_sheet_placed",
        SanctuarySticker = "sanctuary_sticker_placed",
    },
    Loaded = {
        Start = "start_loading",
        Options = "options_loaded",
        Expansion = "expansion_loaded",
        Shop = "shop_loaded",
        Items = "items_loaded",
        Class = {
            Start = "class_ready",
            Unlocked = "class_unlocked",
            Enhanced = "class_enhanced",
        },
        Prosperity = "prosperity_loaded",
        Treasure = "treasure_loaded",
    },
    Saved = {
        Start = "start_saving",
        Achievements = "achievements_saved",
        Events = "events_saved",
        Items = "items_saved",
        Party = "party_saved",
        Options = "options_saved",
        Extensions = "extensions_saved",
    }
}

---@param handler fun(savefile: gh_Savefile): void
---@param event string
function Task.registerLoad(handler, event)
    Logger.debug("Registering handler for load event %s", event)
    EventManager.addHandler(event, handler)
end

---@param handler fun(savefile: gh_Savefile): void
---@param event string
function Task.registerSave(handler, event)
    Logger.debug("Registering handler for save event %s", event)
    EventManager.addHandler(event, handler)
end

---@param handler fun(savefile: gh_Savefile, class: string): void
---@param event string
function Task.registerForCharacter(handler, event)
    Logger.debug("Registering handler for character event %s", event)
    EventManager.addHandler(event, handler)
end

---@param event string
---@param savefile gh_Savefile
function Task.completeSave(event, savefile)
    Logger.debug("Completing save event %s", event)
    EventManager.triggerEvent(event, savefile)
end

---@param event string
---@param savefile gh_Savefile
function Task.completeLoad(event, savefile)
    Logger.debug("Completing load event %s", event)
    EventManager.triggerEvent(event, savefile)
end

---@param event string
---@param savefile gh_Savefile
---@param class string
function Task.completeForCharacter(event, savefile, class)
    Logger.debug("Completing character event %s for class %s", event, class)
    EventManager.triggerEvent(event, savefile, class)
end

---@param handler fun(obj: tts__Object, player: number, character: gh_Save_Character): void
---@param events string | string[]
function Task.registerPerPlayer(handler, events)
    if type(events) == "table" then
        local perPlayer = {}
        local totalSize = #events
        local function callback(obj, player, character)
            local current = perPlayer[player]
            if current == nil then
                current = 0
            end
            current = current + 1
            perPlayer[player] = current

            if current == totalSize then
                perPlayer[player] = 0
                handler(obj, player, character)
            end
        end
        for _, event in ipairs(--[[---@type string[] ]] events) do
            EventManager.addHandler(event, callback)
        end
    else
        EventManager.addHandler(--[[---@type string]] events, handler)
    end
end

---@param event string
---@param object tts__Object
---@param player number
---@param character gh_Save_Character
function Task.completeForPlayer(event, object, player, character)
    Logger.debug("Completing player event %s for player %s", event, player)
    EventManager.triggerEvent(event, object, player, character)
end

return Task