return function (self) 
---@type Tweener
local tween = self._T.Tween
if (tween ~= nil) then
	tween:Destroy()
end
end