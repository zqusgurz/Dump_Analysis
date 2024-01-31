return function (self,b) 
---@type Tweener
local tweener = self._T.BlinkTweener
if (b and tweener == nil) then
	local canvas = self.Entity.CanvasGroupComponent
	tweener = _TweenLogic:MakeTween(0.8, 0.1, 0.5, EaseType.Linear, function(val)
		canvas.GroupAlpha = val
	end)
	tweener.AutoDestroy = false
	tweener.LoopType = TweenLoopType.Restart
	tweener.LoopCount = -1
	self._T.BlinkTweener = tweener
	tweener:Play()
elseif (not b and tweener ~= nil) then
	tweener:Destroy()
	self._T.BlinkTweener = nil
end
end