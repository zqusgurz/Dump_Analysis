return function (self) 
for i,_ in pairs(self.PosToElement) do
	---@type ItemElementComponent
	local p = self.PosToElement[i]
	if (p ~= nil) then
		p:UpdateDisabledItemElement()
	end
end
end