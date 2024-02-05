return function (self,itemId) 
local wt = self:GetWeaponType(itemId)
return wt == _WeaponType.Bow or wt == _WeaponType.Crossbow or wt == _WeaponType.ThrowingGlove
end