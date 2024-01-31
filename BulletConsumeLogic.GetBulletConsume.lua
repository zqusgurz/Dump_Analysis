return function (self,user,skillId,skillLevel,shadowPartner) 
local bulletConsume = 1
if (skillId > 0 and skillLevel > 0) then
	local levelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
	if (levelData ~= nil) then
		bulletConsume = levelData.bulletConsume
		if (bulletConsume <= 0) then
			bulletConsume = levelData.bulletCount
		end
		if (bulletConsume <= 0) then
			bulletConsume = 1
		end
	end
end
if (shadowPartner and user.PlayerTemporaryStat:GetValue(_CTS.ShadowPartner) ~= 0) then
	bulletConsume *= 2
end
if (user.PlayerTemporaryStat:GetValue(_CTS.SoulArrow) ~= 0 or
	user.PlayerTemporaryStat:GetValue(_CTS.SpiritJavelin) ~= 0) then
	bulletConsume = 0
end
return bulletConsume
end