return function (self,skillId,wt,weaponId) 
if (skillId == _Skills.FIGHTER_SWORD_BOOSTER or skillId == _Skills.PAGE_SWORD_BOOSTER) then
	if (wt ~= _WeaponType.OneHandedSword and wt ~= _WeaponType.TwoHandedSword) then
		return false
	end
elseif (skillId == _Skills.FIGHTER_AXE_BOOSTER) then
	if (wt ~= _WeaponType.OneHandedAxe and wt ~= _WeaponType.TwoHandedAxe) then
		return false
	end
elseif (skillId == _Skills.PAGE_MACE_BOOSTER) then
	if (wt ~= _WeaponType.OneHandedMace and wt ~= _WeaponType.TwoHandedMace) then
		return false
	end
elseif (skillId == _Skills.THIEF_DAGGER_BOOSTER) then
	if (wt ~= _WeaponType.Dagger) then
		return false
	end
elseif (skillId == _Skills.MAGE_FP_MAGIC_BOOSTER or skillId == _Skills.MAGE_IL_MAGIC_BOOSTER) then
	if (not _Items:IsOneHandedWeapon(weaponId)) then
		return false
	end
elseif (skillId == _Skills.ASSASSIN_JAVELIN_BOOSTER) then
	if (wt ~= _WeaponType.ThrowingGlove) then
		return false
	end
elseif (skillId == _Skills.SPEARMAN_SPEAR_BOOSTER) then
	if (wt ~= _WeaponType.Spear) then
		return false
	end
elseif (skillId == _Skills.SPEARMAN_POLEARM_BOOSTER) then
	if (wt ~= _WeaponType.PoleArm) then
		return false
	end
elseif (skillId == _Skills.HUNTER_BOW_BOOSTER) then
	if (wt ~= _WeaponType.Bow) then
		return false
	end
elseif (skillId == _Skills.CROSSBOWMAN_CROSSBOW_BOOSTER) then
	if (wt ~= _WeaponType.Crossbow) then
		return false
	end
end
return true
end