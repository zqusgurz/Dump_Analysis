return function (self,sprite,itemId,rate,assetType) 
if (assetType == _ItemAssetType.Regular) then
	if (_Items:IsMSWTransparentPartItem(itemId)) then
		sprite.Color.a = 1
		sprite.ImageRUID = "ad710865e78d417ca92097f92ce568fb"
		_EntityUtils:SetRectSizeUIEntitySafelyEx(sprite.Entity, 12 * rate, 12 * rate)
	elseif (_Items:IsCashItem(itemId)) then
		sprite.Color.a = 1
		sprite.ImageRUID = "21709d4b82004e9da95b771ed2a842cb"
		_EntityUtils:SetRectSizeUIEntitySafelyEx(sprite.Entity, 13 * rate, 13 * rate)
	else
		sprite.Color.a = 0
	end
elseif (assetType == _ItemAssetType.WorldCoinShopProduct) then
	if (_Items:IsEquip(itemId)) then
		local gender = _Items:GetGenderFromId(itemId)
		if (gender == 0) then
			sprite.Color.a = 1
			sprite.ImageRUID = "b423f5374f1d44a1bff4c9bae5264259"
			_EntityUtils:SetRectSizeUIEntitySafelyEx(sprite.Entity, 15, 14)
		elseif (gender == 1) then
			sprite.Color.a = 1
			sprite.ImageRUID = "3803157904a249258a5da6d83e718af5"
			_EntityUtils:SetRectSizeUIEntitySafelyEx(sprite.Entity, 15, 14)
		else
			sprite.Color.a = 0
		end
	elseif (_Items:IsMaplePointChargeItem(itemId)) then
		sprite.Color.a = 1
		sprite.ImageRUID = "a8f3146382c07494d8dbce9b93c1a5c3"
		_EntityUtils:SetRectSizeUIEntitySafelyEx(sprite.Entity, 14 * rate, 14 * rate)
	else
		sprite.Color.a = 0
	end
end

end