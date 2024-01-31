return function (self,user,skillId,param) 
local slv = user.WsCharacterData:GetSkillLevel(skillId)
if (slv <= 0) then
	return 0
end
local levelData = _SkillMan:GetSkillLevelData(skillId, slv)
if (param ~= nil) then
	param.X += levelData.x
end
return levelData.mastery, slv
end