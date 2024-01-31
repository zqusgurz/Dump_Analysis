return function (self,logs) 
local n = _UserService.LocalPlayer.WsUser.CharacterName
local ret = {}
local set = {}
for i=#logs,1,-1 do
	local log = logs[i]
	local sender = log.Sender
	if (sender ~= n) then
		if (not set[sender]) then
			ret[#ret + 1] = sender
			set[sender] = true
		end
	end
end
return ret
end