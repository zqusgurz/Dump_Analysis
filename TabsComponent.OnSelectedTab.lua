return function (self,currentTab) 
for _,t in ipairs(self.Tabs) do
	t:SetSelected(t.TabIndex == currentTab)
end
self.Entity:SendEvent(ChangeTabEvent(currentTab))
end