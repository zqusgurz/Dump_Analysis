return function (self,msg) 
local ret = _CommandLogic_Client:ProcessCommand(msg)
if (ret) then
	return
end
if (_UserService.LocalPlayer.WsUser.AdminLevel > 0) then
	self:TryProcessGMCommand(msg)
end
end