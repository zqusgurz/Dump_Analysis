return function (self,cd,skillId) 
local skill = _SkillMan:GetSkill(skillId)
if (skill == nil) then
	return false
end
local cur = cd:GetSkillLevel(skillId)
if (cur >= skill.MaxLevel) then
	return false
end
if (skill.Invisible and cd:GetSkillLevel(skillId) == 0 and cd:GetMasterLevel(skillId) == 0) then
	return false
end
if (skillId // 10000 == 0) then
	if (cd:GetNoviceSkillPoint() <= 0) then
		return false
	end
else
	-- TODO MasterLevel
	if (cd.Sp <= 0) then
		return false
	end
end
return true
end