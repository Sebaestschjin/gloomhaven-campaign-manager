local EventType = {
    Placed = {
        LockedCharacters = "locked_classes_placed",
        OpeningConditions = "opening_conditions_placed",
        Treasure = "treasure_deck_placed",
        RetirementSheet = "retirement_sheet_placed",
        SanctuarySticker = "sanctuary_sticker_placed",
    },
    Loaded = {
        Start = "start_loading",
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
        Achievements = "achievements_saved",
        Events = "events_saved",
    }
}

return EventType