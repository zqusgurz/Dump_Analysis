return function (self,equipping,equipping2) 
local cm = _AppService:Get().ControlWindowMan
cm:ShowUserInfo()
cm.UserInfo.UserInfoComponent:UpdateTarget(self.Entity, equipping, equipping2)
end