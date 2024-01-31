return function (self) 
if (_UserService.LocalPlayer.WsUser.ExclusiveAction) then
	return
end
---@type WorldCoinProduct
local product = self.Product
if (product) then
	if (product.Currency == 1000) then
		if (product.WorldCoinProductId) then
			_WorldShopService:PromptPurchase(product.WorldCoinProductId)
		end
	elseif (product.Currency == 0) then
		local worldCoinShop = _AppService:Get().ControlWindowMan.WorldCoinShop.WorldCoinShopComponent
		local remain = _UserService.LocalPlayer.WsUserCurrency.MaplePoint
		if (product.Price > remain) then
			-- TODO
		end
	end
end
end