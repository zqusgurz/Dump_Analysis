return function (self,path) 
local function p() return self:ParseResourcePath(path) end
local imgPath, subPath = p()

local obj = self._Caches[imgPath]
if (obj == nil) then
	obj = self:_GetImage(imgPath)
	self._Caches[imgPath] = obj
end
obj = self:FindSubPath(obj, subPath)
return obj
end