return function (self) 
for i,_ in pairs(self.ConsumePosToKey) do
	---@type ItemElementComponent
	local p = self.ConsumePosToKey[i]
	if (p ~= nil) then
		p:UpdateDisabledItemElement()
	end
end
end