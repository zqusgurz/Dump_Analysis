return function (self,from,newMoney) 
local tradingRoom = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
local mine = _UserService.LocalPlayer.OwnerId == from
if (mine) then
	tradingRoom.MyMeso.Text = _NumberUtils:Format(newMoney)
	tradingRoom.MyMesoReadable.Text = _NumberUtils:FormatReadable(newMoney, 0)
	_UserService.LocalPlayer.WsUser:EnableExclusiveAction()
else
	tradingRoom.OtherMeso.Text = _NumberUtils:Format(newMoney)
	tradingRoom.OtherMesoReadable.Text = _NumberUtils:FormatReadable(newMoney, 0)
end
end