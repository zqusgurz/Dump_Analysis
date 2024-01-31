return function (self) 
local userInfoWindow = _AppService:Get().ControlWindowMan.UserInfo.UserInfoComponent
local userId = self.Entity.WsUser.CharacterId
if (userInfoWindow:IsVisible() and userInfoWindow.TargetUserId == userId) then
	userInfoWindow:UpdateAvatar(self.Entity)
end
end