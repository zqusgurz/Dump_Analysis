return function (self,itemId) 
if (_Items:IsEquip(itemId)) then
	local info = _ItemInfoMan:GetEquip(itemId)
	return info.reqLevel
else
	local info = _ItemInfoMan:GetItem(itemId)
	return info.i_reqLevel
end
end