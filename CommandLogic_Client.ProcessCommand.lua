return function (self,msg) 
local args = _UtilLogic:Split(msg, " ")
local argc = #args
local user = _UserService.LocalPlayer
if (Environment:IsMakerPlay()) then
	local debugFunc = self.DebugCommands[args[1]]
	if (debugFunc) then
		local ret = debugFunc(_CommandLogic_Client_Debug, user, argc, args)
		if (ret == nil) then
			return true
		end
		return ret
	end
end
local func = self.ClientCommands[args[1]]
if (func ~= nil) then
	local ret = func(self, user, argc, args)
	if (ret == nil) then
		return true
	end
	return ret
end
return false
end