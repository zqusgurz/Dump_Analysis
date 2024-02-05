return function (self,mobSkillId,mobSkillLevel) 
local levels = self.MobSkill[mobSkillId]
if (levels ~= nil) then
	return levels[mobSkillLevel]
end
return nil
end