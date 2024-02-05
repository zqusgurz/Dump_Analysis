return function (self) 
if (self.MaxActivatedTab == -1) then
	return self:GetTabCount()
end
return self.MaxActivatedTab
end