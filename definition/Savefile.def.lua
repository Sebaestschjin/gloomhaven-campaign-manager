---@shape gh_Savefile
---@field enhancements nil | gh_Enhanced_Class[]
---@field global nil | gh_Global
---@field party nil | gh_Party
---@field unlocked nil | gh_Unlocked

---@shape gh_Enhanced_Class
---@field class string
---@field abilities gh_Enhanced_Ability[]

---@shape gh_Enhanced_Ability
---@field name string
---@field enhancements gh_Enhancement[]

---@shape gh_Enhancement
---@field enhancement string
---@field position number

---@shape gh_Global
---@field scenarios nil | gh_Scenario[]
---@field achievements nil | gh_Achievement
---@field prosperity nil | number

---@shape gh_Scenario
---@field number number
---@field state gh_Scenario_State

---@shape gh_Achievement
---@field name string
---@field count nil | number

---@alias gh_Scenario_State 'Done' | 'Unlocked' | 'Locked'

---@shape gh_Party
---@field characters nil | gh_Character[]

---@shape gh_Character
---@field class string
---@field name string
---@field xp number
---@field gold number
---@field quest string | number
---@field checkmarks number
---@field perks number[]
---@field items gh_Item[]
---@field abilities string[]
---@field notes string[]
---@field hiddenNotes string[]

---@shape gh_Item
---@field name string
---@field position string

---@shape gh_Unlocked
---@field classes nil | string[]