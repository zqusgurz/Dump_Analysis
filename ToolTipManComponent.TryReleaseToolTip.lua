return function (self,tooltipType,tooltipOrigin) 
---@type Entity
local tooltip = self.Test_Tooltips[tooltipType]
if (tooltip) then
	local beforeOrigin = tooltip.TooltipBaseComponent.TooltipOrigin
	-- log("Releasing Tooltip-", tooltipType, " BeforeOrigin: ", beforeOrigin, " Origin: ", tooltipOrigin)
	if (beforeOrigin == nil or tooltipOrigin == nil or tooltipOrigin.Id == beforeOrigin.Id) then
	    tooltip.Enable = false
	    tooltip.Visible = false
		tooltip.TooltipBaseComponent.TooltipOrigin = nil
	end
end
end