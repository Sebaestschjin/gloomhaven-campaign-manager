---@shape gh_ScenarioTree
---@field nodes gh_ScenarioTree_Node[]
---@field version '2'

---@shape gh_ScenarioTree_Node
---@field id string
---@field status gh_ScenarioTree_State
---@field treasure gh_ScenarioTree_Treasures

---@alias gh_ScenarioTree_Treasures table<string, gh_ScenarioTree_Treasure>

---@alias gh_ScenarioTree_Treasure table<'looted', gh_ScenarioTree_Looted>

---@alias gh_ScenarioTree_State 'complete' | 'incomplete' | 'attempted'
---@alias gh_ScenarioTree_Looted 'true' | 'false'