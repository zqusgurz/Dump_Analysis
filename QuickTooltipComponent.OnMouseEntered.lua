return function (self,pos) 
local toolTipMan = _AppService:Get().ToolTipMan
if (toolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	if (not self.Entity.EnabledInHierarchy) then
		return
	end
	local tooltip = toolTipMan:CreateToolTip(self.TooltipType, self.Entity)
	if (self.TooltipType == _TooltipType.Function) then
		tooltip.TooltipFunctionComponent:SetText(self.Title, self.Desc)
	else
		tooltip.TooltipMiniComponent:SetText(self.Title)
	end
	if (tooltip ~= nil) then
		toolTipMan:MovePosition(tooltip)
		tooltip.Visible = true
	end
end
end