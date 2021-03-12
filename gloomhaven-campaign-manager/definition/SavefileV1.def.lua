--- The complete savefile format (v1)
---@shape gh_Savefile_v1
---@field enhancements gh_Save_v1_EnhancedClass[]
---@field unlocked gh_Save_Unlocked
---@field global gh_Save_v1_Global
---@field party gh_Save_v1_Party
---@field retired gh_Save_Retired[]
---@field events gh_Save_v1_EventDeck[]
---@field metadata gh_Save_Metadata

---@shape gh_Save_v1_EnhancedClass
---@field class string
---@field abilities gh_Save_v1_Enhanced_Ability[]

---@shape gh_Save_v1_Enhanced_Ability
---@field name string
---@field enhancements gh_Save_v1_Ability_Enhancement[]

---@shape gh_Save_v1_Ability_Enhancement
---@field enhancement string
---@field position number

---@shape gh_Save_v1_Global
---@field scenarios gh_Save_v1_Scenario[]
---@field achievements gh_Save_v1_Achievement[]
---@field prosperity number the number of prosperity checkmarks

---@shape gh_Save_v1_Scenario
---@field number number
---@field state gh_Scenario_State

---@shape gh_Save_v1_Achievement
---@field name string
---@field count nil | number

---@shape gh_Save_v1_Party
---@field name string
---@field location string
---@field notes string[]
---@field achievements string[]
---@field reputation number
---@field characters gh_Save_v1_Character[]

---@shape gh_Save_v1_Character
---@field class string @Name of the class
---@field name string @Player given name
---@field xp number @Current amount of experience
---@field gold number @Current amount of gold
---@field quest gh_Save_Quest @Personal quest card
---@field checkmarks number @Number of checkmarks for battle goals
---@field perks number[] @List of unlocked perks
---@field items gh_Save_v1_Character_Item[] @List of possessed items
---@field abilities string[] @List of unlocked abilities
---@field notes string[] @List of notes on the character sheet (visible to all)
---@field hiddenNotes string[] @List of hidden notes (only visible to player itself)
---@field hand string[] @List of abilities in the player's hand

---@shape gh_Save_v1_Character_Item
---@field name string
---@field position gh_Save_Character_Item_Position

---@shape gh_Save_v1_EventDeck
---@field deck string
---@field bottomUp number[]
---@field add number[]
---@field remove number[]