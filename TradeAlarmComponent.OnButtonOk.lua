return function (self) 
if (self.TradeId > 0) then
	_TradingRoomLogic:AcceptTrade(_UserService.LocalPlayer, self.TradeId)
	self.TradeId = -1
end
self.__AlarmComponent__.OnButtonOk(self)
end