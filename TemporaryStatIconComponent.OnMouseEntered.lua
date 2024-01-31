return function (self,pos) 
local tm = _AppService:Get().ToolTipMan
if (tm:IncRefCountAndCheck(self.Entity)) then
	if (self.Id > 0) then
		local tooltip = _TooltipLogic:MakeSkillTooltip(self.Id, false, self.Entity)
		tooltip.Visible = true
	elseif (self.Id < 0) then
		local tooltip = tm:CreateToolTip(_TooltipType.Bundle, self.Entity)
		local item = _ItemInfoMan:MakeItem(-self.Id, 1)
		tooltip.TooltipItemComponent:SetItemTooptip(nil, item)
		tm:MovePosition(tooltip)
		tooltip.Visible = true
	end
end
end