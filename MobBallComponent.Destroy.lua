return function (self) 
---@type Tweener
local tween = self.Tween
if (tween) then
	tween:Destroy()
	self.Tween = nil
end
---@type Tweener
local moveTween = self.MoveTween
if (moveTween) then
	moveTween:Destroy()
	self.MoveTween = nil
end
if (self.Timer > 0) then
	_TimerService:ClearTimer(self.Timer)
	self.Timer = 0
end
self._T["K"] = nil
self.Hit = nil
end