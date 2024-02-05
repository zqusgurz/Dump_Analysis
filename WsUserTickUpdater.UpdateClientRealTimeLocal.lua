return function (self) 
if (self:CannotUpdate()) then
	return
end
local user = self.Entity
local u = user.WsUser
local uc = user.WsUserController

_PlayerActiveSkillLogic_Teleport:CheckTeleport(user)
user.CharacterActionComponent:UpdateClientRealTime()
uc:UpdateClientRealTime(false)
self:UpdateChatBalloonExpire(u)
uc:UpdateFalldown()
self.ControlWindowMan:UpdateClientRealTime()
user.WsUserAvatarLook:UpdateFixedRate(true)
u:CheckEndureOnRope()
end