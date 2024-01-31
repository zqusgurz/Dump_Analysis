return function (self,show) 
local admin = show and _UserService.LocalPlayer.WsUser.AdminLevel >= 10
_EntityService:GetEntityByPath("/ui/DefaultGroup/SystemCommandUI").Enable = admin
end