return function (self) 
_TradingRoomLogic:LeaveTradeRoom(_UserService.LocalPlayer)
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.TradingRoom))
end