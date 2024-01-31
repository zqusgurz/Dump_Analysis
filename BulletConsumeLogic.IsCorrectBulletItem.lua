return function (self,weaponType,itemId) 
if (weaponType == _WeaponType.Bow) then
	return itemId // 1000 == 2060
elseif (weaponType == _WeaponType.Crossbow) then
	return itemId // 1000 == 2061
elseif (weaponType == _WeaponType.ThrowingGlove) then
	return itemId // 10000 == 207
end
return false
end