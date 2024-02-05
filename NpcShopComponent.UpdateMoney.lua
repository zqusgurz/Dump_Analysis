return function (self) 
local player = _UserService.LocalPlayer
local cd = player.WsCharacterData
self.Money.Text = _NumberUtils:Format(cd.Money)
end