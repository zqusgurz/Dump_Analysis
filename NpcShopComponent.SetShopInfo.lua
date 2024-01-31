return function (self,npcId,list) 
self.NpcTemplateId = npcId
local stockList = {}
local recharges = {}
for i=1,#list do
	---@type NpcShopItem
	local shopItem = list[i]
	local price = shopItem.Price
	if (_Items:IsRechargable(shopItem.ItemId) and price == 0) then
		recharges[#recharges + 1] = shopItem
	else
		if (price > 0) then
			stockList[#stockList + 1] = shopItem		
		end
	end
end
self.StockList = stockList
self.Recharges = recharges
self.NpcSprite.ImageRUID = _NpcTemplateMan:GetNpcShopAnimation(npcId)
end