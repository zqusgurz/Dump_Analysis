return function (self,entry) 
self.CashLockerEntry = entry
self.ItemIcon.Entity.Enable = entry ~= nil
if (entry) then
	---@type WorldCoinProduct
	local product = _WorldCoinShopLogic.Products[entry.ProductId]
	if (product) then
		local item = _ItemInfoMan:MakeItem(product.ItemId, product.Number)
		self.ItemIcon.IconType = _ItemIconElementType.WorldCoinShop
		self.ItemIcon:SetItemRaw(item)
		if (_Items:IsTreatSingly(item.ItemId)) then
			self.ItemIcon:SetItemNo(-1)
		else
			self.ItemIcon:SetItemNo(item.Number)
		end
	else
		log_error("failed to load product id ", entry.ProductId)
	end
	if (entry.Status == 1 or entry.Status == 2) then
		self.ItemIcon:SetSlotDisabled(true)
	else
		self.ItemIcon:SetSlotDisabled(false)
	end
else
	self:SetSelected(false)
end
end