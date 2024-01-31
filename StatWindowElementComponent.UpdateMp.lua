return function (self) 
local localPlayer = _UserService.LocalPlayer
local mp = localPlayer.WsUser.Mp
local maxMp = localPlayer.WsUser.MaxMp
local ap = localPlayer.WsCharacterData.Ap

self.Text.TextComponent.Text = string.format("%d / %d", mp, maxMp)
self.BtApUp.FunctionButtonComponent:SetInteractible(false)
end