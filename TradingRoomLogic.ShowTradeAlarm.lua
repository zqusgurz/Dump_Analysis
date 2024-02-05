return function (self,fromName,tradeId) 
-- log("Receive Trade Alarm from: ", fromName, " / Id:", tradeId)
local alarmMan = _AppService:Get().AlarmMan
local localUser = _UserService.LocalPlayer
if (localUser.PlayerOptionComponent:GetNumber("Trade", 1) == 0) then
	self:DeclineTrade(localUser, tradeId, _TradeDeclineReason.Alarm_Reject)
	return
end
if (alarmMan.TradeAlarm.EnabledInHierarchy) then
	self:DeclineTrade(localUser, tradeId, _TradeDeclineReason.Alarm_AlreadyPopup)
	return
end
local user = localUser.WsUser
if (user:IsDied()) then
	self:DeclineTrade(localUser, tradeId, _TradeDeclineReason.Alarm_Reject)
	return
end
if (user:IsOnJob()) then
	self:DeclineTrade(localUser, tradeId, _TradeDeclineReason.Alarm_Busy)
	return
end
-- log("Show Trade Alarm")
alarmMan:ShowTradeAlarm(fromName, tradeId)
end