return function (self,tUserId,pop) 
local userInfoWindow = _AppService:Get().ControlWindowMan.UserInfo.UserInfoComponent
if (userInfoWindow:IsVisible() and userInfoWindow.TargetUserId == tUserId) then
	userInfoWindow.Pop.Text = tostring(pop)
end
end