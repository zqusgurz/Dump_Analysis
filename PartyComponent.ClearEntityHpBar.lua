return function (self) 
local users = _UserService:GetUsersByMapName(_UserService.LocalPlayer.CurrentMapName)
for i=1,#users do
	local user = users[i]
	user.WsUser:DestroyEntityHpBar()
end
end