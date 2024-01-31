return function (self,pos) 
local toolTipMan = _AppService:Get().ToolTipMan
if (toolTipMan:IncRefCountAndCheck(self.Entity)) then
	if (_UtilLogic:IsNilorEmptyString(self.QuestFullName)) then
		return
	end
	if (isvalid(_DragDropLogic.Dragging)) then
		return
	end
	if (not self.Entity.EnabledInHierarchy) then
		return
	end
	local tooltip = toolTipMan:CreateToolTip(_TooltipType.Mini, self.Entity)
	tooltip.TooltipMiniComponent:SetText(self.QuestFullName)
	toolTipMan:MovePosition(tooltip)
	_UpdateComponentLogic:InsertUpdateVisible(tooltip)
end
end