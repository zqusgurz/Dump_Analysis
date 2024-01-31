return function (self,pos) 
local toolTipMan = _AppService:Get().ToolTipMan
if (toolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	if (not self.Entity.EnabledInHierarchy) then
		return
	end
	
	-- Make Tooltip
	---@type ItemSlotBase
	local item = self.Item
	local cd = _UserService.LocalPlayer.WsCharacterData
	---@type Entity
	local tooltip = nil
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
	
	if (tooltip ~= nil) then
		toolTipMan:MovePosition(tooltip)
		tooltip.Visible = true
	end
end
end