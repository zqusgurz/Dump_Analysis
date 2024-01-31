return function (self,cd,damage) 
local slv = cd:GetSkillLevel(_Skills.THIEFMASTER_MESO_GUARD)
damage = math.min(self.MaxDamage, math.max(1, damage))
damage = math.floor(damage)
if (slv > 0) then
	local levelData = _SkillMan:GetSkillLevelData(_Skills.THIEFMASTER_MESO_GUARD, slv)
	local ret = damage / 2
	if (cd.Money < ret * levelData.x / 100) then
		return 100 * cd.Money // levelData.x
	end
	return ret
end
return 0
end