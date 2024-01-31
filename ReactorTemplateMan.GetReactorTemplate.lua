return function (self,templateID) 
local data = self.Caches[templateID]
if (data ~= nil) then
	return data
end

local obj = _ResourceMan:ParseGenericWzCollection("Reactor", string.format("%07d.img", templateID))
self.Caches[templateID] = self:Load(obj)
return data
end