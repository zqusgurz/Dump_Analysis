return function (self,skillId,skillLevel,weaponType,action,attackMobIndex) 
if (skillId ~= 0) then
	local skill = _SkillMan:GetSkill(skillId)	
	if (skill ~= nil) then
		local hitAni = skill:GetHit()
		local hitNum = 0
		if (hitAni == nil) then
			local levelData = skill:GetLevelData(skillLevel)
			if (levelData.hit) then
				hitNum = _TableUtils:GetLength(levelData.hit)	
				hitAni = levelData.hit
			end
		else
			hitNum = skill.HitNum
		end
		if (hitNum == 1) then
			return hitAni["0"]
		elseif (hitNum > 1) then
			return hitAni[tostring(_GlobalRand32:RandomIntegerRange(0,hitNum-1))]
		end
	end
end

local path
if (weaponType == _WeaponType.OneHandedSword or weaponType == _WeaponType.Dagger or
		weaponType == _WeaponType.TwoHandedSword or weaponType == _WeaponType.OneHandedAxe or
		weaponType == _WeaponType.TwoHandedAxe or weaponType == _WeaponType.Spear or
		weaponType == _WeaponType.PoleArm) then
	path = "sword"
else
	path = "mace"
end
if (_CharacterAction:IsFinalAction(action)) then
	return self.HitEffect[path .. "F"]
else
	return self.HitEffect[path .. tostring(_GlobalRand32:RandomIntegerRange(1,2))]
end
end