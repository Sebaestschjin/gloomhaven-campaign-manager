---@alias gh_Game_HpProgression number[]

---@shape gh_Game_Class
---@field isStartingClass boolean
---@field isCustomClass nil | boolean
---@field boxGuid GUID
---@field hp gh_Game_HpProgression
---@field perks gh_Game_Perk[]
---@field playerMat nil | number
---@field abilities table<string, gh_Game_Ability>
---@field extraFigure nil | gh_Game_Class_ExtraFigure

---@shape gh_Game_Class_ExtraFigure
---@field name string
---@field hp gh_Game_HpProgression

---@shape gh_Game_Perk
---@field add nil | string[]
---@field remove nil | string[]
---@field ignore nil | gh_Game_Perk_Ignore

---@alias gh_Game_Perk_Ignore 'I' | 'S'

---@shape gh_Game_Ability
---@field name nil | string
---@field level 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 'X'
---@field enhancements gh_Game_Ability_Enhancement[]

---@shape gh_Game_Ability_Enhancement
---@field [1] number
---@field [2] number

---@shape gh_Game_Achievement
---@field maxCount number

---@alias gh_Game_Quests table<string, gh_Game_Quest>

---@shape gh_Game_Quest
---@field index number Index in the quest deck
---@field number number Card number

---@shape gh_Game_Quest_Info
---@field name string
---@field index number Index in the quest deck
---@field number number Card number

---@shape gh_Game_Items
---@field prosperity nil | gh_Game_ProsperityLevel
---@field reward nil | gh_Game_Item_RewardType

---@alias gh_Game_ProsperityLevel 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

---@alias gh_Game_Item_RewardType 'loot' | 'random'