return function (self,user,skillId) 
local weapon = user.WsCharacterData:GetItem(1, -_BodyParts.Weapon)
local wt = 0
if (weapon ~= nil) then
	wt = _Items:GetWeaponType(weapon.ItemId)
end

local function IsNeedWeapon()
	if (self.MeleeAttackSkills[skillId]) then
		return true
	elseif (self.ShootAttackSkills[skillId]) then
		return true
	elseif (self.MagicAttackSkills[skillId]) then
		return true
	elseif (self.KeydownSkills[skillId]) then
		return true
	elseif (self.BoosterSkills[skillId]) then
		return true
	end
	return false
end

if (IsNeedWeapon()) then
	if (wt == 0) then
		log_warning(string.format("weapon type is 0"))
		return false
	end
end

local skill = _SkillMan:GetSkill(skillId)
if (skill == nil) then
	log_warning(string.format("skill %d is nil", skillId))
	return false
end
if (skillId == _Skills.ARCHER_ARROW_BLOW or skillId == _Skills.ARCHER_DOUBLE_SHOT) then
	if (wt ~= _WeaponType.Bow and wt ~= _WeaponType.Crossbow) then
		log_warning(string.format("skill %d wt need bow or crossbow / player wt = %d", skillId, wt))
		return false
	end
end
local skillWeaponType = skill.Weapon
if (skillWeaponType ~= 0 and skillWeaponType ~= wt) then
	log_warning(string.format("skill %d wt = %d / player wt = %d", skillId, skillWeaponType, wt))
	return false
end

if (wt ~= 0) then
	if (not self:CheckBoosterWeaponType(skillId, wt, weapon.ItemId)) then
		log_warning(string.format("booster skill %d / player wt = %d", skillId, wt))
		return false
	end
end

return true
end