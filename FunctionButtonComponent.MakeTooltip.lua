return function (self) 
if (_UtilLogic:IsNilorEmptyString(self.TooltipText)) then
	return
end
local toolTipMan = _AppService:Get().ToolTipMan
local tooltip = toolTipMan:CreateToolTip(_TooltipType.Mini, self.Entity)
tooltip.TooltipMiniComponent:SetText(self.TooltipText)
toolTipMan:MovePosition(tooltip)
_UpdateComponentLogic:InsertUpdateVisible(tooltip)
end