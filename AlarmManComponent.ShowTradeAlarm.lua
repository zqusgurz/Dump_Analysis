return function (self,fromName,tradeId) 
local root = self:GetPositionRoot()
local alarm = self.TradeAlarm
local t = alarm.TradeAlarmComponent
t.OtherName = fromName
t.TradeId = tradeId
t:Show()
end