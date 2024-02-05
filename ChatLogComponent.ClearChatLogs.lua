return function (self) 
local logs = self.ChatLogs
for i=#logs,1,-1 do
	local log = logs[i]
	if (isvalid(log)) then
		_EntityService:Destroy(log)
	end
end
self.ChatLogs = {}
end