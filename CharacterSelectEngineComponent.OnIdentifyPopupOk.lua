return function (self) 
if (self.IdentifyPopup.Enable) then
	self.IdentifyPopup.LoginErrorWindowComponent:Close()
end
self:SetIdentifyTimer(0)
end