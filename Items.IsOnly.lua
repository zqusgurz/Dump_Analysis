return function (self,itemId) 
local item = _ItemInfoMan:GetItem(itemId)
if (item == nil) then
	return false
end
return item.i_only ~= 0
end