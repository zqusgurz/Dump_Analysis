return function (self) 
if (self.PartyId > 0) then
	_PartyProcessorLogic:DeclineParty(_UserService.LocalPlayer, self.PartyId, _PartyDeclineReason.Alarm_Decline)
	self.PartyId = -1
end
self.__AlarmComponent__.OnHide(self)
end