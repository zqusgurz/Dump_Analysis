return function (self,enteredMap) 
local user = self.Entity
while _UserService.LocalPlayer == nil do
	wait(0.5)
end
local localUser = _UserService.LocalPlayer

if (user.OwnerId ~= localUser.OwnerId) then
	if (enteredMap.Name == "Login") then
		user.AvatarRendererComponent.Enable = false
		user.NameTagComponent.Enable = false
		user.TouchReceiveComponent.Enable = false
	end
	return
end

_FieldAttributeLogic:ChangeMode(user, enteredMap)
if (enteredMap.Name == "Login") then
	local app = _AppService:Get()
	app:CloseAllTooltip()
	app:ClearAllControl()
end
_DevLogic:UpdateSystemCommandUI(false)

user.MovementComponent:Stop()
user.WsUser:SetMovementEnable(false)
self:CheckBeginMapLoading(user, enteredMap.Name)
end