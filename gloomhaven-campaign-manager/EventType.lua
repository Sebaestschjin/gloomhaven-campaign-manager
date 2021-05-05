local EventType = {
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
        Achievements = "achievements_saved",
        Events = "events_saved",
        Items = "items_saved",
        Party = "party_saved",
        Options = "options_saved"
    }
}

return EventType