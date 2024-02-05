return function (self,entity) 
---@type Tweener
local tweener = self.Tweeners[entity]
if (tweener) then
	tweener:Destroy()
	self.Tweeners[entity] = nil
end
end