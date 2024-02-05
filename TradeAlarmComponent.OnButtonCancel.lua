return function (self) 
if (self.TradeId > 0) then
	_TradingRoomLogic:DeclineTrade(_UserService.LocalPlayer, self.TradeId, _TradeDeclineReason.Alarm_Decline)
	self.TradeId = -1
end
self.__AlarmComponent__.OnButtonCancel(self)
end