return function (self,skillId) 
---@type SkillRecord
local sr = self.Skill[skillId]
if (sr == nil) then
	return 0
end
return sr.SkillLevel
end