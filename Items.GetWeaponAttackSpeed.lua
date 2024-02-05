return function (self,itemId) 
local wt = self:GetWeaponType(itemId)
if (wt == 0) then
	return ""
end
local info = _ItemInfoMan:GetEquip(itemId)
if (info.attackSpeed == 0 or info.attackSpeed == 1) then
	return "엄청나게 빠름"
elseif (info.attackSpeed == 2 or info.attackSpeed == 3) then
	return "매우 빠름"
elseif (info.attackSpeed == 4 or info.attackSpeed == 5) then
	return "빠름"
elseif (info.attackSpeed == 6) then
	return "보통"
elseif (info.attackSpeed == 7 or info.attackSpeed == 8) then
	return "느림"
elseif (info.attackSpeed == 9 or info.attackSpeed == 10) then
	return "매우 느림"
elseif (info.attackSpeed == 11 or info.attackSpeed == 12) then
	return "엄청나게 느림"
end
end