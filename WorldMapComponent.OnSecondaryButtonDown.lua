return function (self,pos) 
local parent = self.ParentKey
if (not parent) then
	return
end
self:ChangeWorldMap(parent, true)
end