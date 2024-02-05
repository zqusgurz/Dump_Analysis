return function (self,pos) 
---@type CashLockerEntry
local cashLockerEntry = self.CashLockerEntry
if (cashLockerEntry == nil) then
	return
end
if (_AppService:Get().ToolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	local product = _WorldCoinShopLogic.Products[cashLockerEntry.ProductId]
	if (product) then
		local item = _ItemInfoMan:MakeItem(product.ItemId, 1)
		item.Expire = tonumber(cashLockerEntry.ItemExpire)
		local tooltip = _TooltipLogic:MakeShopItemTooltip(item, self.Entity)
		tooltip.Visible = true
	end
end
end