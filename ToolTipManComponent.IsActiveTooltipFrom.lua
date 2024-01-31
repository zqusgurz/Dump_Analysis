return function (self,tooltipType,tooltipOrigin) 
---@type Entity
local tooltip = self.Test_Tooltips[tooltipType]
if (tooltip and tooltip.Enable) then
	local tt = tooltip.TooltipBaseComponent
	return tt.TooltipOrigin == tooltipOrigin
end
return false
end