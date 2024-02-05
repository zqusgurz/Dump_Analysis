return function (self,skillId,skillLevel) 
local currentLevelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
if (currentLevelData ~= nil) then
	return _StringMan:GetSkillString(skillId, currentLevelData.hs) or ""
end
return ""
end