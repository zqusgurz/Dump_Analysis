return function (self) 
---@type table<Entity>
local childs = self.ActiveModalEntities
local childNum = #childs
for i=childNum,1,-1 do
	childs[i]:Destroy()
end
self.ActiveModalEntities = {}
_InputManager:RemoveAllPressed()
end