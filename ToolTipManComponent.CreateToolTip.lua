return function (self,tooltipType,tooltipOrigin) 
-- log("CreateTooltip", tooltipType)
---@type Entity
local tooltip = self.Test_Tooltips[tooltipType]
if (tooltip) then
    tooltip.Enable = true
	tooltip.TooltipBaseComponent.TooltipOrigin = tooltipOrigin
	-- log("Created Tooltip-", tooltipType, " Origin: ", tooltipOrigin)
	
	-- Close Other tooltips
	
	for i=1,_TooltipType.MAX do
		if (i == tooltipType) then
			continue
		end
		self:ClearTooltip(i)
	end
	
	if (tooltipType == _TooltipType.Mini) then
		tooltip.TooltipMiniComponent.Padding = Vector2.zero
	end
end
return tooltip
end