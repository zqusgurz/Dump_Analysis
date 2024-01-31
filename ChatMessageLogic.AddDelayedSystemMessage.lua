return function (self,type,msgType,mes) 
local next = self.DelayedSystemMessagePool[type] or 0
local now = _UtilLogic.ElapsedSeconds
if (next > now) then
	return
end
self.DelayedSystemMessagePool[type] = now + 1
self:Add(msgType, mes)
end