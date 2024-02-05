return function (self,user,weaponType,attackType,param) 
local slv = 0
---@type SkillLevelData
local levelData = nil
if (weaponType == _WeaponType.Bow or weaponType == _WeaponType.Crossbow) then
	if (attackType ~= _AttackType.Shoot) then
		return 0
	end
	slv = user.WsCharacterData:GetSkillLevel(_Skills.ARCHER_CRITICAL_SHOT)
	if (slv > 0) then
		levelData = _SkillMan:GetSkillLevelData(_Skills.ARCHER_CRITICAL_SHOT, slv)
	end
elseif (weaponType == _WeaponType.ThrowingGlove) then
	if (attackType ~= _AttackType.Shoot) then
		return 0
	end
	slv = user.WsCharacterData:GetSkillLevel(_Skills.ASSASSIN_CRITICAL_THROW)
	if (slv > 0) then
		levelData = _SkillMan:GetSkillLevelData(_Skills.ASSASSIN_CRITICAL_THROW, slv)
	end
end
if (levelData ~= nil) then
	param.Damage = levelData.damage
	param.Prop = levelData.prop
end
return slv
end