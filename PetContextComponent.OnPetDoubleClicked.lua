return function (self) 
_UserService.LocalPlayer.WsUser.ExclusiveAction = true
local player = self.Entity.Parent.PetComponent.Owner
_PlayerInfoLogic:RequestUserInfo(player)
end