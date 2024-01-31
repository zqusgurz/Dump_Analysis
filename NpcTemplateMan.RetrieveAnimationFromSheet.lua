return function (self,templateID,animations) 
if (animations == nil) then
	return
end
local hasStand, stand = animations.ActionSheet:TryGetValue("stand")
local hasShop, shop = animations.ActionSheet:TryGetValue("shop")
if (hasStand) then
	self.NpcStandAnimation[templateID] = stand
end
if (hasShop) then
	self.NpcShopAnimation[templateID] = shop	
end
end