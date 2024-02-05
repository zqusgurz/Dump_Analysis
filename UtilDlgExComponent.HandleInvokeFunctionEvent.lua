return function (self,event) 
local f = event.Function
if (f == "EndChat") then
	if (self:OnPreCheckHandler(-1)) then
		self:EndChat()
	end
elseif (f == "Ok" or f == "Yes" or f == "Next") then
	if (self:OnPreCheckHandler(1)) then
		self:OnButtonHandler(1)
	end
elseif (f == "No" or f == "Prev") then
	if (self:OnPreCheckHandler(0)) then
		self:OnButtonHandler(0)
	end
end
end