return function (self,skillId,skillLevel,order,damages,finalAfterSlashBlash) 
local interrupt = false
local rate = 0
if (finalAfterSlashBlash) then
	rate = self.DamageDecRate[0][order]
else
	if (skillId == _Skills.HUNTER_ARROW_BOMB_BOW) then
		local levelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
		rate = levelData.x / 100
		if (order == 0 and damages[1] == 0) then
			interrupt = true
		end
	elseif (skillId == _Skills.CROSSBOWMAN_IRON_ARROW_CROSSBOW) then
		rate = self.DamageDecRate[1][order]
	elseif (skillId == _Skills.ARCHMAGE_IL_CHAIN_LIGHTNING or skillId == _Skills.VIPER_ENERGY_ORB) then
		rate = self.DamageDecRate[2][order]
	elseif (skillId == _Skills.CROSSBOWMASTER_PIERCING) then
		rate = self.DamageDecRate[3][order]
	end
end
if (rate ~= 0) then
	local floor = math.floor
	for i=1,16 do
		damages[i] = floor(damages[i] * rate)
	end
end
return interrupt
end