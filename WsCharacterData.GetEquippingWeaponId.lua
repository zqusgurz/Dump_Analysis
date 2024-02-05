return function (self) 
local wp = self.AvatarLook[_BodyParts.Weapon]
if (wp ~= nil) then
	local eqpWeapon = self:GetItem(1, -_BodyParts.Weapon)
	if (eqpWeapon and eqpWeapon.ItemId == wp) then	
		return wp
	end
end
return 0
end