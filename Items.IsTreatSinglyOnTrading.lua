return function (self,item) 
if (self:IsTreatSingly(item.ItemId)) then
	return true
end
if (_Items:HasItemAttr(item, _ItemAttribute.TradeOnce)) then
	return true
end
return false
end