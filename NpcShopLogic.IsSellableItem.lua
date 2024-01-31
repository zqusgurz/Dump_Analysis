return function (self,item) 
local itemId = item.ItemId
if (_Items:IsCashItem(itemId)) then
	return false
end
if (_Items:IsQuestItem(itemId)) then
	return false
end
if (_Items:IsNotSaleItem(itemId)) then
	return false
end
if (_Items:HasItemAttr(item, _ItemAttribute.NotSale)) then
	return false
end
if (item.Expire ~= 0) then
	return false
end
return true
end