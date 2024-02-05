return function (self) 
local tabCount = self:GetTabCount()
local maxActivated = self:GetMaxActivated()
for i=1, tabCount do
	---@type TabMenu
	local tab = self.Tabs[i]
	if (tab == nil) then
		continue
	end
	tab.TabEntity.Enable = i <= maxActivated
end
end