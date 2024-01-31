return function (self,itemId) 
local type = self:GetItemType(itemId)
return type == self.StateChange or type == self.PetFood or type == self.TamingMobFood
end