return function (self) 
local cd = _UserService.LocalPlayer.WsCharacterData
local money = cd.Money - cd.TradingMoney
self.Money.Text = _NumberUtils:Format(money)
end