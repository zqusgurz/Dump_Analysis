return function (self) 
--log("Begin Update Basic Stat")
local app = self:Get()
local u = _UserService.LocalPlayer
local user = u.WsUser
local userData = u.WsCharacterData
local basicStat = u.WsBasicStat

local cwndMan = app.ControlWindowMan
local statWindow = cwndMan.Stat.StatWindowComponent
statWindow.Str:UpdateStat("STR")
statWindow.Dex:UpdateStat("DEX")
statWindow.Int:UpdateStat("INT")
statWindow.Luk:UpdateStat("LUK")
statWindow.Pad:UpdateStat("PAD")
statWindow.Mad:UpdateStat("MAD")
--log("End Update Basic Stat")

cwndMan.Equip.EquipWindowComponent:UpdateDisabledEquip()
end