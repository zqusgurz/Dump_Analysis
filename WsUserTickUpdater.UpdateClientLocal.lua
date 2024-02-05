return function (self) 
if (self:CannotUpdate()) then
	return
end
local user = self.Entity
user.WsUserController:UpdateClientLocal()
user.WsUser:TryRecovery()
user.PlayerTemporaryStat:CheckUpdateDebuff()
end