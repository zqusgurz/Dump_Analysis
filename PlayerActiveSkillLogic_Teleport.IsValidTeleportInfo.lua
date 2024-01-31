return function (self,user) 
---@type TeleportInfo
local info = user.WsUserController.Teleport
if (info ~= nil and info.Valid) then
	return true
end
return false
end