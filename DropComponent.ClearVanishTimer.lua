return function (self) 
---@type Tweener
local tween = self.VanishTween
if (tween ~= nil) then
	tween:Destroy()
	self.VanishTween = nil
end
end