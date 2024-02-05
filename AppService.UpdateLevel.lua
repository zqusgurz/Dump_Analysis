return function (self) 
--log("Begin Update Level")
local app = self:Get()
local userData = _UserService.LocalPlayer.WsCharacterData

app:GetStatusBar().Level:DrawNumber(userData.Level)

local cwndMan = app.ControlWindowMan
local statWindow = cwndMan.Stat.StatWindowComponent
statWindow.Level.Text.TextComponent.Text = tostring(userData.Level)
statWindow.Ap.Text = tostring(userData.Ap)
--statWindow.Hp.BtApUp.FunctionButtonComponent:SetInteractible(userData.Ap > 0)
--statWindow.Mp.BtApUp.FunctionButtonComponent:SetInteractible(userData.Ap > 0)
statWindow.BtApAuto:SetInteractible(userData.Ap > 0)
statWindow.Hp.BtApUp.FunctionButtonComponent:SetInteractible(false)
statWindow.Mp.BtApUp.FunctionButtonComponent:SetInteractible(false)
statWindow.Str.BtApUp.FunctionButtonComponent:SetInteractible(userData.Str < _PlayerStatLogic.MaxStat and userData.Ap > 0)
statWindow.Dex.BtApUp.FunctionButtonComponent:SetInteractible(userData.Dex < _PlayerStatLogic.MaxStat and userData.Ap > 0)
statWindow.Int.BtApUp.FunctionButtonComponent:SetInteractible(userData.Int < _PlayerStatLogic.MaxStat and userData.Ap > 0)
statWindow.Luk.BtApUp.FunctionButtonComponent:SetInteractible(userData.Luk < _PlayerStatLogic.MaxStat and userData.Ap > 0)
self:CheckBasicStatGuide(userData, statWindow)

--log("End Update Level")
cwndMan.Equip.EquipWindowComponent:UpdateDisabledEquip()
_LocalQuestMon:CheckQuestDemandState(-1, true)
end