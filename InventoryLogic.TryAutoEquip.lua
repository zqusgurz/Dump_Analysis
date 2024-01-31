return function (self,TI,Pos) 
if (TI ~= 1) then
	return
end
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
if (not user.WsUser:IsAvailableInventoryOperation()) then
	return
end 
if (Pos > 0) then
	--log("Try equip..", TI, Pos)
	local item = self:RawGetItem(cd, TI, Pos)
	if (item == nil) then
		return
	end
	local bodyParts = _Items:GetBodyPartsFromItem(item.ItemId, cd.Gender)
	local cash = _Items:IsCashItem(item.ItemId)
	for i,part in ipairs(bodyParts) do
		local eqpPos = -part
		if (cash) then
			eqpPos -= 100
		end
		local eqp = self:RawGetItem(cd, 1, eqpPos)
		if (eqp == nil or i == #bodyParts) then
			local function tryEquip()
				user.WsUser.ExclusiveAction = true
				self:ChangeSlotPosition(cd, TI, Pos, eqpPos)
				_SoundService:PlaySound(_DragDropLogic.DragDropSounds["DragEnd"], 1)
			end
			if (_Items:HasItemAttr(item, _ItemAttribute.TradeOnce)) then
				_UtilDlgLogic:YesNo("착용 후에는 거래할 수 없는 장비입니다.\r\n 착용하시겠습니까?", function()
					tryEquip()
				end, nil)
			else
				tryEquip()
			end
			return
		end
	end
elseif (Pos < 0) then
	log("Try unequip..", TI, Pos)
	local freeSlot = self:GetNextEmptySlot(cd, TI, 0)
	if (freeSlot < 0) then
		return
	end
	if (cd:IsEquippingCashPart(Pos)) then
		Pos -= 100
	end
	user.WsUser.ExclusiveAction = true
	self:ChangeSlotPosition(cd, TI, Pos, freeSlot)
	_SoundService:PlaySound(_DragDropLogic.DragDropSounds["DragEnd"], 1)
end
end