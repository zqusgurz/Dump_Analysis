return function (self) 
for i,_ in pairs(self.PosToElement) do
	self:InvalidateItem(i)
end
self:UpdateDisabledEquip()
end