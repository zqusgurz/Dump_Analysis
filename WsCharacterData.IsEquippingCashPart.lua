return function (self,bodyParts) 
if (bodyParts > 0) then
	bodyParts = -bodyParts
end
if (bodyParts > -100) then
	bodyParts -= 100
end
return _InventoryLogic:RawGetItem(self, 1, bodyParts) ~= nil
end