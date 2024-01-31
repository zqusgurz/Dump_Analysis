return function (self,product,user) 
if (not product.Purchasable) then
	return false
end
local cd = user.WsCharacterData
if (_Items:IsEquip(product.ItemId)) then
	local genderForItem = _Items:GetGenderFromId(product.ItemId)
	if (genderForItem ~= 2 and genderForItem ~= cd.Gender) then
		return false
	end
end
return true
end