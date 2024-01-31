return function (self,pos) 
local toolTipMan = _AppService:Get().ToolTipMan
if (toolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	local tooltip = toolTipMan:CreateToolTip(_TooltipType.Mini, self.Entity)
	tooltip.TooltipMiniComponent.Padding = Vector2(24, 0)
	tooltip.TooltipMiniComponent:SetText(self:MakeTooltipText())
	if (tooltip ~= nil) then
		toolTipMan:MovePosition(tooltip)
		_UpdateComponentLogic:InsertUpdateVisible(tooltip)
	end
end
end