return function (self,from) 
local tradingRoom = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
local mine = _UserService.LocalPlayer.OwnerId == from
if (mine) then
	tradingRoom.MyLock.Enable = true
	tradingRoom.MyMesoButton.FunctionButtonComponent:SetInteractible(false)
	tradingRoom.BtTrade.FunctionButtonComponent:SetInteractible(false)
else
	tradingRoom.OtherLock.Enable = true
end
end