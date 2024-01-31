return function (self,pos) 
---@type WorldCoinProduct
local product = self.Product
if (product == nil) then
	return
end
if (_AppService:Get().ToolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	local item = _ItemInfoMan:MakeItem(product.ItemId, 1)
	if (_Items:IsPet(product.ItemId)) then
		item["TooltipDeadTime"] = true
	elseif (product.Period > 0) then
		item["Period"] = product.Period
	end
	local tooltip = _TooltipLogic:MakeShopItemTooltip(item, self.Entity)
	tooltip.Visible = true
end
end