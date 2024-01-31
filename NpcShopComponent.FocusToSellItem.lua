return function (self,index) 
pcall(function()
	local sellItemCount = math.max(0, #self.SellItems-1)
	if (sellItemCount > 0) then
		local normalizedY = (index-1) / sellItemCount
		local scrollLayout = self.SellItemList.Parent.ScrollLayoutGroupComponent
		scrollLayout:SetScrollNormalizedPosition(UITransformAxis.Vertical, normalizedY)
	end
end)
end