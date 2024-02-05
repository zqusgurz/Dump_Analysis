return function (self,target) 
---@type Tweener
local beforeTween = self.Tween
if (beforeTween) then
	beforeTween:Destroy()
end
local sp = self.Entity.SpriteGUIRendererComponent
local currentAlpha = sp.Color.a
if (currentAlpha == target) then
	return
end
local easeType
if (target == 0) then
	easeType = EaseType.QuadEaseIn
else
	easeType = EaseType.QuadEaseOut
end
local duration = math.abs(target - currentAlpha) * 0.25
local tween = _TweenLogic:MakeTween(currentAlpha, target, duration, easeType, function(v)
	sp.Color.a = v
end)
tween:SetOnEndCallback(function()
	self.Tween = nil
end)
tween.AutoDestroy = true
tween:Play()
self.Tween = tween
end