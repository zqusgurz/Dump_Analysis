return function (self,delta) 
---@type table<Entity>
local childs = self.ActiveModalEntities
for i=1,#childs do
	local child = childs[i]
	if (child.Enable) then
		self.BlockRaycast.Enable = true
		return
	end
end
if (self.ConfirmBuyItem.Enable) then
	self.BlockRaycast.Enable = true
	return
end
self.BlockRaycast.Enable = false
end