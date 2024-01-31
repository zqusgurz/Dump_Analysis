return function (self,name,value) 
if (name == "MaplePoint") then
	local shop = _AppService:Get().ControlWindowMan.WorldCoinShop.WorldCoinShopComponent
	shop.MaplePointText.Text = _NumberUtils:Format(value)
end
end