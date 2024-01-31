return function (self,visibleFalse) 
for _, child in ipairs(self.Entity.Children) do
	if (visibleFalse) then	
		child.Visible = false
	end
	self:Release(child)
end
end