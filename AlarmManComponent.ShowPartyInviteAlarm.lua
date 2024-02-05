return function (self,fromName,job,level,partyId) 
local root = self:GetPositionRoot()
local alarm = self.PartyAlarm
local t = alarm.PartyInviteAlarmComponent
t.OtherName = fromName
t.Job = job
t.Level = level
t.PartyId = partyId
t:Show()
end