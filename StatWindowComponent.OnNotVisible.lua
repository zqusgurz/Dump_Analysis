return function (self) 
for _,o in ipairs(self.SubTooltips) do
	---@type Entity
	local obj = o
	obj.QuickTooltipComponent:RemoveTooltip()
end
self.StatDetail.StatDetailComponent:OnNotVisible()
end