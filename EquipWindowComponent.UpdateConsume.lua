return function (self) 
for k,_ in pairs(self.ConsumePosToKey) do
	self:InvalidateConsume(k)
end
self:UpdateDisabledConsume()
end