return function (self) 
if not (_UtilLogic:IsNilorEmptyString(self._cachedFullPath)) then
	return self._cachedFullPath
end

local obj = self
local ret = ""

while true do
	ret = obj.Name .. ret
	if obj.Parent == nil then
		break
	end
	ret = "/" .. ret
	obj = obj.Parent
end
self._cachedFullPath = ret
return ret
end