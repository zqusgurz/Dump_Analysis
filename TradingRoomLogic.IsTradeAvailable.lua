return function (self,item) 
if (_Items:IsQuestItem(item.ItemId)) then
	return false
end
if (not _Items:HasItemAttr(item, _ItemAttribute.TradeOnce)) then
	if (_Items:IsTradeBlock(item.ItemId)) then
		return false
	end
	if (_Items:HasItemAttr(item, _ItemAttribute.NoTrade)) then
		return false
	end
	if (_Items:IsCashItem(item.ItemId)) then
		return false
	end
end
return true
end