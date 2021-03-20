---@shape fantasySetup_Achievement_Info
---@field name string
---@field guids GUID[]

---@alias fantasySetup_Scenario_Stickers table<GUID, fantasySetup_Scenario_Info>

---@shape fantasySetup_Scenario_Info
---@field number number

---@shape fantasySetup_CharacterSheet
---@field buttons fantasySetup_CharacterSheet_Buttons
---@field ui fantasySetup_CharacterSheet_Ui

---@alias fantasySetup_CharacterSheet_Check '' | 'u{2717}'

---@alias fantasySetup_CharacterSheet_Buttons table<string,fantasySetup_CharacterSheet_Check>

---@shape fantasySetup_CharacterSheet_Ui
---@field gold string
---@field Items string
---@field Name string
---@field Notes string
---@field NotesFront string
---@field xp string