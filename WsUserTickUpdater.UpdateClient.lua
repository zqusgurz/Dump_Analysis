return function (self) 
if (self:CannotUpdate()) then
	return
end
self.Entity.WsUserAvatarLook:UpdateClient()
end