return function (self) 
local tooltips = self.Test_Tooltips
for i=1,_TooltipType.MAX do
	---@type Entity
	local tooltip = tooltips[i]
	if (not tooltip.Enable) then
		continue
	end
	self:MovePosition(tooltip)
	tooltip.TooltipBaseComponent:CheckRenderedOrigin()
end
end