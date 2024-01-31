return function (self,itemId) 
local recharges = self.Recharges
local stockList = self.StockList
for i=1,#recharges do
	---@type NpcShopItem
	local shopItem = recharges[i]
	if (shopItem.ItemId == itemId) then
		return shopItem.UnitPrice
	end
end
for i=1,#stockList do
	---@type NpcShopItem
	local shopItem = stockList[i]
	if (shopItem.ItemId == itemId) then
		return shopItem.UnitPrice
	end
end
return nil
end