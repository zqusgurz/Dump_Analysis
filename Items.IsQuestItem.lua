return function (self,itemId) 
if (_Items:IsEquip(itemId)) then
	local info = _ItemInfoMan:GetEquip(itemId)
	if (info.quest ~= 0) then
		return true
	end
else
	local info = _ItemInfoMan:GetItem(itemId)
	if (info.i_quest ~= 0) then
		return true
	end
end
return false
end