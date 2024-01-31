return function (self) 
if (isvalid(_DragDropLogic.Dragging)) then
	return
end
if (not self.Entity.EnabledInHierarchy) then
	return
end
if (_UtilLogic:IsNilorEmptyString(self.TooltipText)) then
	return
end
local toolTipMan = _AppService:Get().ToolTipMan
if (toolTipMan:IncRefCountAndCheck(self.Entity)) then
	local tooltip = toolTipMan:CreateToolTip(_TooltipType.Mini, self.Entity)
	tooltip.TooltipMiniComponent:SetText(self.TooltipText)
	if (tooltip ~= nil) then
		toolTipMan:MovePosition(tooltip)
		_UpdateComponentLogic:InsertUpdateVisible(tooltip)
	end
end
end