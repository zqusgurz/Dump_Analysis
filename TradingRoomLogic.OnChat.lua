return function (self,from,text) 
local tradeDlg = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
if (not tradeDlg:IsVisible()) then
	return
end
tradeDlg:OnAddChat(from, text)
end