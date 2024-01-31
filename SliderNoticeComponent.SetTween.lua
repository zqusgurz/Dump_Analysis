return function (self,b) 
---@type Tweener
local tween = self.Tween
if (tween) then
	tween:Destroy()
	self.Tween = nil
end
if (b) then
	local width = self.Text.UITransformComponent.RectSize.x
	local speed = 2 -- 픽셀
	local duration = width / speed * 0.03
	tween = _TweenLogic:MoveTo(self.Text, Vector2(-width, 0), duration, EaseType.Linear)
	tween.LoopType = TweenLoopType.Restart
	tween.LoopCount = -1
	self.Tween = tween
end
end