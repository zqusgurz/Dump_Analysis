return function (self,itemId,gender) 
local ret = {}
local itemGender = self:GetGenderFromId(itemId)
if (gender == 2 or itemGender == 2 or gender == itemGender) then
	local cat = itemId // 10000
	if (cat == 100) then
		table.insert(ret, _BodyParts.Cap)
	elseif (cat == 101) then
		table.insert(ret, _BodyParts.FaceAcc)
	elseif (cat == 102) then
		table.insert(ret, _BodyParts.EyeAcc)
	elseif (cat == 103) then
		table.insert(ret, _BodyParts.EarAcc)
	elseif (cat == 104) then
		table.insert(ret, _BodyParts.Clothes)
	elseif (cat == 105) then
		table.insert(ret, _BodyParts.Clothes)
	elseif (cat == 106) then
		table.insert(ret, _BodyParts.Pants)
	elseif (cat == 107) then
		table.insert(ret, _BodyParts.Shoes)
	elseif (cat == 108) then
		table.insert(ret, _BodyParts.Gloves)
	elseif (cat == 109) then
		table.insert(ret, _BodyParts.Shield)
	elseif (cat == 110) then
		table.insert(ret, _BodyParts.Cape)
	elseif (cat == 111) then
		table.insert(ret, _BodyParts.Ring1)
		table.insert(ret, _BodyParts.Ring2)
		table.insert(ret, _BodyParts.Ring3)
		table.insert(ret, _BodyParts.Ring4)
	else
		if (self:IsWeapon(itemId)) then
			table.insert(ret, _BodyParts.Weapon)
		end
	end
end
return ret
end