return function (self,itemId) 
if (itemId == nil) then
	return ""
end
local obj = self.ItemStringDesc[itemId]
if (obj ~= nil) then
	return string.gsub(obj, "\\r", "")
end
return ""
end