return function (self,itemId) 
if (itemId == nil) then
	return ""
end
local obj = self.ItemStringName[itemId]
if (obj ~= nil) then
	return obj
end
return ""
end