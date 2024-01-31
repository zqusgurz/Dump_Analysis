return function (self,user,wt,attackType,skillId,param) 
local mastery, masteryLevel = 0, 0
local p = _CalcDamageLogic:MakeIncOutParam()
if (wt == _WeaponType.OneHandedSword or wt == _WeaponType.TwoHandedSword) then
	if (attackType == _AttackType.Melee or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.FIGHTER_SWORD_MASTERY, _Skills.PAGE_SWORD_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.OneHandedAxe or wt == _WeaponType.TwoHandedAxe) then
	if (attackType == _AttackType.Melee or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.FIGHTER_AXE_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.OneHandedMace or wt == _WeaponType.TwoHandedMace) then
	if (attackType == _AttackType.Melee or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.PAGE_MACE_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.Dagger) then
	if (attackType == _AttackType.Melee or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.THIEF_DAGGER_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.Spear) then
	if (attackType == _AttackType.Melee or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.SPEARMAN_SPEAR_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.PoleArm) then
	if (attackType == _AttackType.Melee or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.SPEARMAN_POLEARM_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.Bow) then
	if (attackType == _AttackType.Shoot or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.HUNTER_BOW_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.Crossbow) then
	if (attackType == _AttackType.Shoot or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.CROSSBOWMAN_CROSSBOW_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
elseif (wt == _WeaponType.ThrowingGlove) then
	if (attackType == _AttackType.Shoot or attackType == -1) then
		mastery, masteryLevel = self:GetAnyMastery(user, {_Skills.ASSASSIN_JAVELIN_MASTERY}, p)
		if (param ~= nil) then
			param.IncACC += p.X
		end
	end
end
return mastery, masteryLevel
end