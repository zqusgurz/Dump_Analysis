return function (self,pos) 
if (_AppService:Get().ToolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	---@type ItemSlotBase
	local item
	---@type NpcShopItem
	local shopItem = self.LinkedNpcShopItem
	if (shopItem ~= nil) then
		item = _ItemInfoMan:MakeItem(shopItem.ItemId, 1)
	else
		local cd = _UserService.LocalPlayer.WsCharacterData
		item = cd:GetItem(self.LinkedSellTI, self.LinkedSellPos)
		if (item == nil or item.ItemId ~= self.LinkedSellItemId) then
			return
		end
	end
	local tooltip = _TooltipLogic:MakeShopItemTooltip(item, self.Entity)
	tooltip.Visible = true
end
end