return function (self,from,fromName,text,id,hash) 
local tradeDlg = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
if (not tradeDlg:IsVisible()) then
	return
end
tradeDlg:OnAddChat(from, text)
_ChatSystemLogic:InsertLog(fromName, text, id, hash)
end