return function (self,pos) 
local toolTipMan = _AppService:Get().ToolTipMan
if (toolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	local cd = _UserService.LocalPlayer.WsCharacterData
	---@type Entity
	local tooltip = nil
	if (self.LinkedItemTI == 1 and self.LinkedItemPos < 0) then
		---@type ItemSlotEquip
		local item = _InventoryLogic:RawGetItem(cd, self.LinkedItemTI, self.LinkedItemPos)
		---@type ItemSlotEquip
		local cashEqp = _InventoryLogic:RawGetItem(cd, self.LinkedItemTI, self.LinkedItemPos - 100)
		---@type Entity
		if (cashEqp ~= nil and item ~= nil) then
			tooltip = toolTipMan:CreateToolTip(_TooltipType.CashEquip, self.Entity)
			tooltip.TooltipCashEquipComponent:SetItemTooptip(cd, cashEqp, item)
		elseif (cashEqp ~= nil or item ~= nil) then
			if (cashEqp ~= nil) then
				item = cashEqp
			end
			tooltip = toolTipMan:CreateToolTip(_TooltipType.Equip, self.Entity)
			tooltip.TooltipEquipComponent:SetItemTooptip(cd, item)
		end
	elseif (self.LinkedItemTI == 6) then
		local itemId = self.ItemId
		if (itemId > 0) then
			local item = _ItemInfoMan:MakeItem(itemId, 1)
			tooltip = toolTipMan:CreateToolTip(_TooltipType.Bundle, self.Entity)
			tooltip.TooltipItemComponent:SetItemTooptip(cd, item)
		end
	else
		local item = _InventoryLogic:RawGetItem(cd, self.LinkedItemTI, self.LinkedItemPos)
		if (item ~= nil) then
			if (_Items:IsEquip(item.ItemId)) then
				---@type ItemSlotEquip
				local eqp = item
				tooltip = toolTipMan:CreateToolTip(_TooltipType.Equip, self.Entity)
				tooltip.TooltipEquipComponent:SetItemTooptip(cd, eqp)
			else
				tooltip = toolTipMan:CreateToolTip(_TooltipType.Bundle, self.Entity)
				tooltip.TooltipItemComponent:SetItemTooptip(cd, item)
			end
		end
	end
	if (tooltip ~= nil) then
		toolTipMan:MovePosition(tooltip)
		_UpdateComponentLogic:InsertUpdateVisible(tooltip)
	end
end
end