return function (self,templateID) 
local shop = self.NpcShopAnimation[templateID]
if (shop) then
	return shop
end
local stand = self.NpcStandAnimation[templateID] or ""
return stand
end