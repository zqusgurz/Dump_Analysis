return function (self,itemId) 
local ret = self._equips[itemId]
if (ret or self:IsServer()) then
	return ret
end
if (self.NotExistsItem[itemId]) then
	return nil
end
return self:TryLoadItem(itemId)
end