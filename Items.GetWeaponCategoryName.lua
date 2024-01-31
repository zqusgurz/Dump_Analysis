return function (self,itemId) 
local wt = self:GetWeaponType(itemId)
if (wt == _WeaponType.OneHandedSword) then
	return "한손검"
elseif (wt == _WeaponType.OneHandedAxe) then
	return "한손도끼"
elseif (wt == _WeaponType.OneHandedMace) then
	return "한손둔기"
elseif (wt == _WeaponType.Dagger) then
	return "단검"
elseif (wt == _WeaponType.Wand) then
	return "완드"
elseif (wt == _WeaponType.Staff) then
	return "스태프"
elseif (wt == _WeaponType.TwoHandedSword) then
	return "두손검"
elseif (wt == _WeaponType.TwoHandedAxe) then
	return "두손도끼"
elseif (wt == _WeaponType.TwoHandedMace) then
	return "두손둔기"
elseif (wt == _WeaponType.Spear) then
	return "창"
elseif (wt == _WeaponType.PoleArm) then
	return "폴암"
elseif (wt == _WeaponType.Bow) then
	return "활"
elseif (wt == _WeaponType.Crossbow) then
	return "석궁"
elseif (wt == _WeaponType.ThrowingGlove) then
	return "아대"
end
return ""
end