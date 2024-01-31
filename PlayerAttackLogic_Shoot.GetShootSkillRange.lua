return function (self,cd,skillId,wt) 
if (skillId ~= 0) then
	local skillLevel = cd:GetSkillLevel(skillId)
	local levelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
	if (levelData ~= nil) then
		if (levelData.range > 0) then
			return levelData.range
		end
	end
	if (skillId == 4121003 or skillId == 4221003) then
		return 300
	end
end
---@type integer, SkillLevelData
local base, rangeLevelData = 0, nil
if (wt == _WeaponType.Bow or wt == _WeaponType.Crossbow) then
	base = 300
	local rangeSkillLevel = cd:GetSkillLevel(_Skills.ARCHER_EYE_OF_AMAZON)
	if (rangeSkillLevel > 0) then
		rangeLevelData = _SkillMan:GetSkillLevelData(_Skills.ARCHER_EYE_OF_AMAZON, rangeSkillLevel)
	end
elseif (wt == _WeaponType.ThrowingGlove) then
	base = 200
	local rangeSkillLevel = cd:GetSkillLevel(_Skills.ROGUE_KEEN_EYES)
	if (rangeSkillLevel > 0) then
		rangeLevelData = _SkillMan:GetSkillLevelData(_Skills.ROGUE_KEEN_EYES, rangeSkillLevel)
	end
end
if (rangeLevelData ~= nil) then
	base += rangeLevelData.range
end
return base
end