return function (self,item) 
local ret = {}
if (self:HasItemAttr(item, _ItemAttribute.TradeOnce)) then
    ret[#ret + 1] = "1회 교환 가능"
else
	if (self:HasItemAttr(item, _ItemAttribute.NoTrade) or _Items:IsTradeBlock(item.ItemId)) then
		ret[#ret + 1] = "교환 불가"
	end
end
if (self:HasItemAttr(item, _ItemAttribute.NotSale) or _Items:IsNotSaleItem(item.ItemId)) then
    ret[#ret + 1] = "상점 판매 불가"
end
if (_Items:IsEquip(item.ItemId)) then
	local eqpInfo = _ItemInfoMan:GetEquip(item.ItemId)
	if (eqpInfo.only ~= 0) then
		ret[#ret + 1] = "고유 아이템"
	end
	if (eqpInfo.quest ~= 0) then
		ret[#ret + 1] = "퀘스트 아이템"
	end
else
	local info = _ItemInfoMan:GetItem(item.ItemId)
	if (info.i_only ~= 0) then
		ret[#ret + 1] = "고유 아이템"
	end
	if (info.i_quest ~= 0) then
		ret[#ret + 1] = "퀘스트 아이템"
	end
end
return ret
end