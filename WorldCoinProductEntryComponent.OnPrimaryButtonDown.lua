return function (self,pos) 
---@type WorldCoinProduct
local product = self.Product
if (not product) then
	log_warning("product is nil")
	return
end
--if (product.Currency ~= 1000) then
	local clicked = _UtilLogic.ElapsedSeconds
	if (clicked - self.LastClicked < 1) then
		if (_Items:IsEquip(product.ItemId)) then
			local itemGender = _Items:GetGenderFromId(product.ItemId)
			local playerGender = _UserService.LocalPlayer.WsCharacterData.Gender
			if (itemGender == 2 or itemGender == playerGender) then
				local shop = _AppService:Get().ControlWindowMan.WorldCoinShop.WorldCoinShopComponent
				shop:AvatarEquipPreview(product.ProductId, product.ItemId)
			end
		end
	end
	self.LastClicked = clicked
--end
end