return function (self,cd,skillId,incMpCon) 
---@type SkillLevelData
local levelData = nil
if (_Jobs:IsCorrectJobForSkillRoot(cd.Job, _Jobs.MAGE_FIRE_POISON)) then
	local slv = cd:GetSkillLevel(_Skills.MAGE_FP_ELEMENT_AMPLIFICATION)
	if (slv > 0) then
		levelData = _SkillMan:GetSkillLevelData(skillId, slv)
	end
elseif (_Jobs:IsCorrectJobForSkillRoot(cd.Job, _Jobs.MAGE_THUNDER_COLD)) then
	local slv = cd:GetSkillLevel(_Skills.MAGE_IL_ELEMENT_AMPLIFICATION)
	if (slv > 0) then
		levelData = _SkillMan:GetSkillLevelData(skillId, slv)
	end
end

local result = 100
if (incMpCon ~= nil) then
	incMpCon[1] = 100
end

if (levelData ~= nil) then
	if (incMpCon ~= nil) then
		if (skillId == _Skills.ARCHMAGE_FP_METEO or
			skillId == _Skills.ARCHMAGE_FP_PARALYZE or
			skillId == _Skills.MAGE_FP_MAGIC_COMPOSITION or
			skillId == _Skills.MAGICIAN_ENERGY_BOLT or
			skillId == _Skills.MAGICIAN_MAGIC_CLAW or
			skillId == _Skills.WIZARD_FP_FIRE_ARROW or
			skillId == _Skills.WIZARD_FP_POISON_BREATH or
			skillId == _Skills.MAGE_FP_EXPLOSION or
			skillId == _Skills.MAGE_FP_POISON_MIST or
			skillId == _Skills.ARCHMAGE_FP_FIRE_DEMON or
			skillId == _Skills.ARCHMAGE_IL_ICE_DEMON or
			skillId == _Skills.ARCHMAGE_IL_CHAIN_LIGHTNING or
			skillId == _Skills.ARCHMAGE_IL_BLIZZARD or
			skillId == _Skills.ARCHMAGE_IL_BIG_BANG or
			skillId == _Skills.WIZARD_IL_COLD_BEAM or
			skillId == _Skills.WIZARD_IL_THUNDER_BOLT or
			skillId == _Skills.MAGE_IL_ICE_STRIKE or
			skillId == _Skills.MAGE_IL_THUNDER_SPEAR or
			skillId == _Skills.MAGE_IL_MAGIC_COMPOSITION) then
			incMpCon[1] = levelData.x
		end
	end
	result = levelData.y
end
return result
end