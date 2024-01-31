return function (self) 
local avatar = self.Entity.WsCharacterData.AvatarLook[_BodyParts.Weapon]
local ac = self.Entity.CharacterActionComponent
if (avatar ~= nil) then
	local item = _ItemInfoMan:GetEquip(avatar)
	if (item ~= nil) then
		ac.CurrentWeaponType = _Items:GetWeaponType(avatar)
		ac.CurrentWeaponId = avatar
		ac.CurrentWeaponAfterImage = item.afterImage
		ac.CurrentWeaponSfx = item.sfx
		ac.CurrentWeaponAttackSpeed = item.attackSpeed
		ac.CurrentWeaponKnockbackProb = item.knockback
		ac.CurrentWeaponAttackType = item.attack
		return
	end
end
ac.CurrentWeaponType = 0
ac.CurrentWeaponId = 0
ac.CurrentWeaponAfterImage = ""
ac.CurrentWeaponSfx = ""
ac.CurrentWeaponAttackSpeed = 0
ac.CurrentWeaponKnockbackProb = 0
ac.CurrentWeaponAttackType = 0
end