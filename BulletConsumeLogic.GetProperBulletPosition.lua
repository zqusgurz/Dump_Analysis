return function (self,cd,skillId,skillLevel,output) 
local weapon = cd:GetItem(1, -_BodyParts.Weapon)
if (weapon == nil) then
	return 0, 0
end
local wt = _Items:GetWeaponType(weapon.ItemId)
if (wt ~= _WeaponType.Bow and wt ~= _WeaponType.Crossbow and wt ~= _WeaponType.ThrowingGlove) then
	return 0, 0
end
local bulletConsume = self:GetBulletConsume(cd.Entity, skillId, skillLevel, false)
local itemPos = 0
local itemId = 0
for i=1,cd.ItemMaxSlot[2],1 do
	local item = cd:GetItem(2, i)
	if (item == nil) then
		continue
	end
	if (self:IsCorrectBulletItem(wt, item.ItemId)) then
		if (_ItemConsumeLogic:IsAbleToConsume(cd, item.ItemId, false)) then
			if (item.Number >= bulletConsume) then
				itemPos = i
				itemId = item.ItemId
				break
			end
		end
	end
end
if (itemPos == 0 or itemId == 0) then
	return 0, 0
end

if (output ~= nil) then
	local cashItemPos = 0
	local cashItemId = 0
	for i=1,cd.ItemMaxSlot[5],1 do
		local item = cd:GetItem(5, i)
		if (item == nil) then
			continue
		end
		if (self:IsCorrectBulletCashItem(wt, item.ItemId)) then
			cashItemId = item.ItemId
			cashItemPos = i
			break
		end
	end
	output.CashItemId = cashItemId
	output.CashItemPos = cashItemPos
	output.ItemId = itemId
end

return itemPos, itemId
end