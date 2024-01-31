return function (self,itemId) 
local ret = self._iconRawAnimations[itemId]
if (ret) then
	return ret
end
if (self.NotExistsItem[itemId]) then
	return nil
end
self:TryLoadItem(itemId)
return self._iconRawAnimations[itemId]
end