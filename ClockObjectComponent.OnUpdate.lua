return function (self,delta) 
if (self._T.ServerTimeDiff == nil) then
	log_error("ServerTimeDiff is nil")
	return
end
---@type DateTime
local currentTime = DateTime(DateTime.UtcNow.Elapsed - self._T.ServerTimeDiff)
---@type DateTime
local lastCurrentTime = self._T.LastCurrentTime
if (lastCurrentTime == nil or lastCurrentTime.Elapsed // 1000 ~= currentTime.Elapsed // 1000) then
	self:Draw(currentTime)
	self._T.LastCurrentTime = currentTime
end
end