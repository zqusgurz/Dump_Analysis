return function (self,user,attackType,skillId,skillLevel,lastFinalAttack) 
if (attackType == _AttackType.Melee) then
	local skill = _SkillMan:GetSkill(skillId)
	if (skill == nil) then
		return 1
	end
	if (skill:IsFinalAttack() and lastFinalAttack == _Skills.SWORDMAN_SLASH_BLAST) then
		skillId = _Skills.SWORDMAN_SLASH_BLAST
		skillLevel = user.WsCharacterData:GetSkillLevel(skillId)
	end
end
local levelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
if (levelData ~= nil) then
	local svrMobCount = levelData.mobCount
	if (svrMobCount <= 1) then
		svrMobCount = 1
	end
	return svrMobCount
end
return 1
end