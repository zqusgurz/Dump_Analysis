return function (self) 
local localPlayer = _UserService.LocalPlayer
local hp = localPlayer.WsUser.Hp
local maxHp = localPlayer.WsUser.MaxHp
local ap = localPlayer.WsCharacterData.Ap

self.Text.TextComponent.Text = string.format("%d / %d", hp, maxHp)
self.BtApUp.FunctionButtonComponent:SetInteractible(false)
end