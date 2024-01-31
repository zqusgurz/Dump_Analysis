return function (self,alarm) 
if (alarm.Type == _AlarmType.Quest) then
	alarm.Entity.Visible = false
	_ObjectPool:Release(self.QuestAlarmPool, alarm.Entity)
elseif (alarm.Type == _AlarmType.Trade) then
	alarm.Entity.Enable = false
elseif (alarm.Type == _AlarmType.Party) then
	alarm.Entity.Enable = false
end
end