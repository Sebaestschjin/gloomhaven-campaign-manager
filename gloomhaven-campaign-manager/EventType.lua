local EventType = {
    Load = {
        Shop = "shop_loaded",
        Items = "items_loaded",
        Class = {
            Start = "class_ready",
            Unlocked = "class_unlocked",
            Enhanced = "class_enhanced",
        },
        Treasure = "treasure_loaded",
    },
    Save = {
        Achievements = "achievements_saved",
        Events = "events_saved",
    }
}

return EventType