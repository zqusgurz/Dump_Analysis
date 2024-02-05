return function (self,cd,skillId) 
local skill = _SkillMan:GetSkill(skillId)
if (skill == nil) then
	return false
end
return skill:IsSatisfiedReq(cd)
end