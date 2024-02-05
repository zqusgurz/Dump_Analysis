return function (self) 
if (self.ShowReviveEventHandler) then
	if (isvalid(self.ShowReviveParent)) then
		self.ShowReviveParent:DisconnectEvent(ShowReviveEvent, self.ShowReviveEventHandler)
	end
	self.ShowReviveParent = nil
	self.ShowReviveEventHandler = nil
end
end