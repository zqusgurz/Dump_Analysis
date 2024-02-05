return function (self,user,option) 
local cd = user.WsCharacterData
local hp = 0

-- recovery 파싱을 안해놨네 ㅡㅡ;
local fieldRecoveryRate = self.FieldRecoveryRate[user.CurrentMapName] or 1
local equipRecoveryRate = 1
if (fieldRecoveryRate > 1) then
	equipRecoveryRate = user.WsPassiveSkill.EquipRecoveryRate
end


if (option == 0 or (option == 1 and cd:GetSkillLevel(_Skills.SWORDMAN_ENDURE) > 0)) then
	hp = 10
	local hpUp = cd:GetSkillLevel(_Skills.SWORDMAN_IMPROVED_HP_RECOVERY)
	if (hpUp > 0) then
		local levelData = _SkillMan:GetSkillLevelData(_Skills.SWORDMAN_IMPROVED_HP_RECOVERY, hpUp)
		if (levelData ~= nil) then
			hp += levelData.hp
		end
	end
elseif (option == 1) then
	hp = 10
	local endures = {_Skills.THIEF_ENDURE, _Skills.ASSASSIN_ENDURE}
	for i=1,#endures do
		local slv = cd:GetSkillLevel(endures[i])
		if (slv == 0) then continue end
		local levelData = _SkillMan:GetSkillLevelData(endures[i], slv)
		if (levelData ~= nil) then
			return levelData.hp
		end
	end
end

return math.floor(hp * fieldRecoveryRate * equipRecoveryRate)
end