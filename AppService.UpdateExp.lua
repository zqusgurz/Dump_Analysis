return function (self) 
--log("Begin Update Exp")
local app = self:Get()
local userData = _UserService.LocalPlayer.WsCharacterData

app:GetStatusBar().Exp:SetValue(userData.Exp, _PlayerStatLogic:GetNextExp(userData.Level), _StatusBarElementTypes.Exp)

local statWindow = app.ControlWindowMan.Stat.StatWindowComponent
statWindow.Exp:UpdateExp()
--log("End Update Exp")
end