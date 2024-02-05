return function (self) 
if (self.PartyId >= 0) then
	_PartyProcessorLogic:AcceptParty(_UserService.LocalPlayer, self.PartyId)
	self.PartyId = -1
end
self.__AlarmComponent__.OnButtonOk(self)
end