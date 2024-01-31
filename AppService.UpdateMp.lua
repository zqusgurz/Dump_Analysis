return function (self) 
--log("Begin Update Mp")
local app = self:Get()
local u = _UserService.LocalPlayer
local user = u.WsUser

app:GetStatusBar().Mp:SetValue(user.Mp, user.MaxMp, _StatusBarElementTypes.Mp)

local statWindow = app.ControlWindowMan.Stat.StatWindowComponent
statWindow.Mp:UpdateMp()
--log("End Update Mp")
end