return function (self,itemId,bulletNumber) 
local basePrice = 0
if (_Items:IsEquip(itemId)) then
	local info = self:GetEquip(itemId)
	basePrice = info.price
else
	local info = self:GetItem(itemId)
	basePrice = info.i_price
	if (_Items:IsRechargable(itemId)) then
		basePrice += math.ceil(bulletNumber * info.i_unitPrice)
	end
end
return basePrice
end