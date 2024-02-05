return function (self,user,option) 
local cd = user.WsCharacterData
local mp = 0

-- recovery 파싱을 안해놨네 ㅡㅡ;
local fieldRecoveryRate = self.FieldRecoveryRate[user.CurrentMapName] or 1
local equipRecoveryRate = 1
if (fieldRecoveryRate > 1) then
	equipRecoveryRate = user.WsPassiveSkill.EquipRecoveryRate
end

if (option == 0) then
	mp = 3
	local mpUpMagician = cd:GetSkillLevel(_Skills.MAGICIAN_IMPROVED_MP_RECOVERY)
	if (mpUpMagician > 0) then
		mp += mpUpMagician * cd.Level // 10
	end
elseif (option == 1) then
	mp = 3
	local endures = {_Skills.THIEF_ENDURE, _Skills.ASSASSIN_ENDURE}
	for i=1,#endures do
		local slv = cd:GetSkillLevel(endures[i])
		if (slv == 0) then continue end
		local levelData = _SkillMan:GetSkillLevelData(endures[i], slv)
		if (levelData ~= nil) then
			return levelData.mp
		end
	end
end
return math.floor(mp * fieldRecoveryRate * equipRecoveryRate)
end