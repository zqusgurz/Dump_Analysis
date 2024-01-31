return function (self) 
local tooltips = self.Test_Tooltips
for i=1,_TooltipType.MAX do
	---@type Entity
	local tooltip = tooltips[i]
	if (tooltip.Enable) then
		local origin = tooltip.TooltipBaseComponent.TooltipOrigin
		if (not origin or not origin.EnabledInHierarchy) then
			tooltip.Enable = false
			tooltip.Visible = false
			tooltip.TooltipBaseComponent.TooltipOrigin = nil
		end
	end
end

end