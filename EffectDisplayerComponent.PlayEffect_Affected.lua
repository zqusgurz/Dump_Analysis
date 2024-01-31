return function (self,skillId) 
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return -- NOTE: useless?
end
local skill = _SkillMan:GetSkill(skillId)
if (skill == nil) then
	return
end
local wzEffect = skill.RawObject["affected"]
if (wzEffect ~= nil) then
	self:_PlayEffect(wzEffect, "Skill/%03d.img/skill/%07d/affected", nil, skillId)
end
end