return function (self,event) 
if (event.Function == "Ok") then
	self:OnButtonOk()
elseif (event.Function == "Cancel") then
	self:OnButtonCancel()
end
end