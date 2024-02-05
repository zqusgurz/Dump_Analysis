return function (self,user) 
local lastChannelChatTime = self.LastChannelChat[user] or 0
local now = _UtilLogic.ServerElapsedSeconds
if (now - lastChannelChatTime < 60) then
	return false
end
self.LastChannelChat[user] = now
return true
end