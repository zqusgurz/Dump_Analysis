return function (self,reason,arg) 
local tradeDlg = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
if (tradeDlg:IsVisible()) then
	tradeDlg:SetVisible(false, false)
end
if (reason == _TradeDeclineReason.Alarm_Decline) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, string.format("'%s'님이 요청을 거절했습니다", arg or ""))
elseif (reason == _TradeDeclineReason.Alarm_Busy) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, string.format("'%s'님은 다른 일을 하는 중입니다", arg or ""))
elseif (reason == _TradeDeclineReason.Alarm_Reject) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, string.format("'%s'님은 초대 거부 상태입니다", arg or ""))
elseif (reason == _TradeDeclineReason.Alarm_AlreadyPopup) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, string.format("'%s'님은 다른 신청을 처리 중입니다.", arg or ""))
elseif (reason == _TradeDeclineReason.Close_Cancel) then
	_UtilDlgLogic:Show("상대방이 교환을 취소했습니다.")
elseif (reason == _TradeDeclineReason.Close_NoOtherPlayer) then
	_UtilDlgLogic:Show("같은 맵에 있을 때에만\r\n교환이 가능합니다.")
elseif (reason == _TradeDeclineReason.Close_NoRoom) then
	_UtilDlgLogic:Show("이미 닫힌 방입니다")
elseif (reason == _TradeDeclineReason.Close_Error) then
	_UtilDlgLogic:Show("교환에 실패하였습니다.")
elseif (reason == _TradeDeclineReason.Close_Admin) then
	_UtilDlgLogic:Show("관리자에게 교환 신청을 할 수 없습니다.")
elseif (reason == _TradeDeclineReason.Close_Identify) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, "계정연동이 완료되지 않아 교환신청이 취소되었습니다.")
elseif (reason == _TradeDeclineReason.Close_SelfIdentify) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, string.format("'%s'님은 계정연동이 완료되지 않아 교환신청을 보낼 수 없습니다.", arg or ""))
end
end