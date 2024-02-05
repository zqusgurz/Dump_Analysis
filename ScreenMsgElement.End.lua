return function (self) 
---@type Tweener
local tweener = self._T.Tweener
if (tweener ~= nil) then
	tweener:Complete()
	tweener:Destroy()
	self._T.Tweener = nil
end
end