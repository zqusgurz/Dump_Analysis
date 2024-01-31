return function (self,logs,target) 
local n = _UserService.LocalPlayer.WsUser.FullName
local attachments = {}
for i=1,#logs do
	local log = logs[i]
	if (log.Sender == target or log.Sender == n) then
		attachments[#attachments + 1] = log
	end
end
return attachments
end