return function (self,user,skillId) 
local comboCounter = user.PlayerTemporaryStat:GetValue(_CTS.ComboCounter)
if (comboCounter >= 0) then
	local slv = user.WsCharacterData:GetSkillLevel(_Skills.CRUSADER_COMBO_ATTACK)
	if (slv > 0) then
		local comboAttackSkill = _SkillMan:GetSkill(_Skills.CRUSADER_COMBO_ATTACK)
		local levelData = _SkillMan:GetSkillLevelData(skillId, slv)
		local damage = levelData.damage
		local x = 0
		if (skillId == _Skills.CRUSADER_PANIC_SWORD or skillId == _Skills.CRUSADER_PANIC_AXE or
				skillId == _Skills.CRUSADER_COMA_AXE or skillId == _Skills.CRUSADER_COMA_SWORD) then
			local val = 0
			if (comboCounter == 1) then val = 0
			elseif (comboCounter == 2) then val = 30
			elseif (comboCounter == 3) then val = 80
			elseif (comboCounter == 4) then val = 150
			elseif (comboCounter == 5) then val = 230
			else damage = 100
			end
			if (val ~= 0) then
				local v = val / 5
				x = v + (val - v) * (slv / comboAttackSkill.MaxLevel)
			end
		else
			local val = 0
			if (comboCounter == 1) then val = 0
			elseif (comboCounter == 2) then val = 5
			elseif (comboCounter == 3) then val = 10
			elseif (comboCounter == 4) then val = 15
			elseif (comboCounter == 5) then val = 20
			else damage = 100
			end
			if (val ~= 0) then
				x = val * (slv / comboAttackSkill.MaxLevel)
			end
		end
		return damage + x
	end
end
return 0
end