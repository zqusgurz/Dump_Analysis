return function (self,user,state) 
local weapon = user.WsCharacterData:GetItem(1, -_BodyParts.Weapon)
local wt = 0
if (weapon ~= nil) then
	wt = _Items:GetWeaponType(weapon.ItemId)
end
if (wt == _WeaponType.Bow or wt == _WeaponType.Crossbow) then
	if (_CharacterActionLogic:IsJumpOrFall(state)) then
		return true
	end
	if (user.RigidbodyComponent:GetCurrentFoothold() == nil) then
		return true
	end
end
return false
end