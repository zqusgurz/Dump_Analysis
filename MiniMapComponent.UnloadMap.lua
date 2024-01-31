return function (self) 
---@type table<Entity>
local icons = self.OtherIconEntities
for i=1,#icons do
	icons[i]:Destroy()
end
self.OtherIconEntities = {}
end