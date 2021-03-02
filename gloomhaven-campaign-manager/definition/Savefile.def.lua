--- The complete savefile format
---@shape gh_Savefile
---@field enhancements gh_Save_Enhancements
---@field unlocked gh_Save_Unlocked
---@field global gh_Save_Global
---@field party gh_Save_Party
---@field retired gh_Save_Retired[]
---@field events gh_Save_EventDecks
---@field metadata gh_Save_Metadata
---@field players gh_Save_Players

---@alias gh_Save_Enhancements table<string, gh_Save_EnhancedClass>

---@alias gh_Save_EnhancedClass table<string, gh_Save_Enhanced_Ability>

---@alias gh_Save_Enhanced_Ability table<string, string>

---@shape gh_Save_Global
---@field scenarios gh_Save_Scenarios
---@field achievements gh_Save_Achievements
---@field prosperity number the number of prosperity checkmarks

---@alias gh_Save_Scenarios table<string, gh_Scenario_State>

---@alias gh_Save_Achievements table<string, number>

---@alias gh_Scenario_State 'Open' | 'Done' | 'Locked'

---@shape gh_Save_Party
---@field name string
---@field location string
---@field notes string[]
---@field achievements string[]
---@field reputation number
---@field characters gh_Save_Character[]

---@shape gh_Save_Character
---@field class string @Name of the class
---@field name string @Player given name
---@field xp number @Current amount of experience
---@field gold number @Current amount of gold
---@field quest gh_Save_Quest @Personal quest card
---@field checkmarks number @Number of checkmarks for battle goals
---@field perks number[] @List of unlocked perks
---@field items gh_Save_Character_Items @List of possessed items
---@field abilities string[] @List of unlocked abilities
---@field notes string[] @List of notes on the character sheet (visible to all)
---@field hiddenNotes string[] @List of hidden notes (only visible to player itself)
---@field hand string[] @List of abilities in the player's hand

---@alias gh_Save_Quest string | number

---@alias gh_Save_Character_Items table<gh_Save_Character_Item_Position, string[]>

---@alias gh_Save_Character_Item_Position 'Head' | 'Armor' | 'HandLeft' | 'HandRight' | 'Boots' | 'Bag1' | 'Bag2' | 'Bag3' | 'Active4' | 'Active1' | 'Active2' | 'Active3' | 'Unequipped'

---@shape gh_Save_Unlocked
---@field classes string[]
---@field treasures number[]
---@field sanctuary nil | number
---@field items string[]
---@field specialConditions gh_Save_Unlocked_Conditions

---@shape gh_Save_Unlocked_Conditions
---@field ancientTechnology nil | boolean
---@field drakeAided nil | boolean
---@field lowReputation nil | boolean
---@field lowestReputation nil | boolean
---@field highReputation nil | boolean
---@field highestReputation nil | boolean
---@field retired nil | boolean
---@field donations nil | number

---@shape gh_Save_Retired
---@field player string
---@field character string
---@field class string
---@field level number
---@field perks number
---@field quest gh_Save_Quest

---@alias gh_Save_EventDecks table<string, gh_Save_EventDeck>

---@shape gh_Save_EventDeck
---@field bottomUp number[]
---@field add number[]
---@field remove number[]

---@shape gh_Save_Metadata
---@field version string
---@field date string

---@alias gh_Save_Players table<string | tts__PlayerColor, gh_Save_Player>

---@shape gh_Save_Player
---@field notes string