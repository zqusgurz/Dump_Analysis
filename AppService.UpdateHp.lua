return function (self) 
--log("Begin Update Hp")
local app = self:Get()
local u = _UserService.LocalPlayer
local user = u.WsUser

app:GetStatusBar().Hp:SetValue(user.Hp, user.MaxHp, _StatusBarElementTypes.Hp)

local statWindow = app.ControlWindowMan.Stat.StatWindowComponent
statWindow.Hp:UpdateHp()
--log("End Update Hp")
end