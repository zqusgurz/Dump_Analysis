return function (self,weaponType,itemId) 
if (weaponType == _WeaponType.Bow or weaponType == _WeaponType.Crossbow) then
	return itemId // 1000 == 5020
elseif (weaponType == _WeaponType.ThrowingGlove) then
	return itemId // 1000 == 5021
end
return false
end