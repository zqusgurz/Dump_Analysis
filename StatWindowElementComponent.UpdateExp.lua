return function (self) 
local localPlayer = _UserService.LocalPlayer
local level = localPlayer.WsCharacterData.Level
local exp = localPlayer.WsCharacterData.Exp

local max = _PlayerStatLogic:GetNextExp(level)
self.Text.TextComponent.Text = string.format("%d (%d%%)", exp, exp * 100 // max)
end