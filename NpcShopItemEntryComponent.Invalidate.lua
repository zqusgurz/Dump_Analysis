return function (self) 
---@type NpcShopItem
local shopItem = self.LinkedNpcShopItem
if (shopItem) then
	self.Icon:SetItem(shopItem.ItemId)
	self.ItemName.Text = _StringMan:GetItemName(shopItem.ItemId)
	self.ItemPrice.Text = string.format("%s 메소", _NumberUtils:Format(shopItem.Price))
	self.RechargeButton.Enable = false
	self.ItemNo.Entity.Enable = false
else
	local cd = _UserService.LocalPlayer.WsCharacterData
	local item = cd:GetItem(self.LinkedSellTI, self.LinkedSellPos)
	if (item == nil or item.ItemId ~= self.LinkedSellItemId) then
		log_warning("Error was occurred")
		_UtilDlgLogic:Show("알 수 없는 오류가 발생해 상점 창을 닫습니다.")
		self.ParentShop:SetVisible(false, true)
		return
	end
	local priceText = string.format("%s 메소", _NumberUtils:Format(_ItemInfoMan:GetSellPrice(item.ItemId, item.Number)))
	
	local recharge = false
	if (_Items:IsRechargable(item.ItemId)) then
		local slotMax = cd:GetSlotMax(item.ItemId)
		if (item.Number < slotMax) then
			local rechargeUnitPrice = self.ParentShop:GetRechargeUnitPrice(item.ItemId)
			if (rechargeUnitPrice) then
				priceText ..= string.format(" / 충전 : %d", math.ceil(rechargeUnitPrice * (slotMax - item.Number)))
				recharge = true
			end
		end
	end
	
	self.Icon:SetItem(item.ItemId)
	self.ItemName.Text = _StringMan:GetItemName(item.ItemId)
	self.ItemPrice.Text = priceText

	local itemNo = self.ItemNo
	if (_Items:IsEquip(item.ItemId)) then
		itemNo.Entity.Enable = false
	else	
		itemNo.Entity.Enable = true
		itemNo.Value = item.Number
		itemNo:Render()
	end
	self.RechargeButton.Enable = recharge
end
end