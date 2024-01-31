return function (self,money,decreasedFee) 
local tradeDlg = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
if (tradeDlg:IsVisible()) then
	tradeDlg:SetVisible(false, false)
end
if (decreasedFee) then
	_UtilDlgLogic:Show(string.format("교환이 성사되었습니다.\r\n수수료를 제외하고 %d메소를\r\n받았습니다. 결과를 확인해 주세요.", money))
else
	_UtilDlgLogic:Show("교환이 성사되었습니다.\r\n결과를 확인해 주세요.")
end
end