return function (self,target) 
---@type Tweener
local beforeTween = self.FadeTween
if (beforeTween) then
	beforeTween:Destroy()
end
local canvas = self.CharacterInfo.CanvasGroupComponent
local currentAlpha = canvas.GroupAlpha
if (currentAlpha == target) then
	return
end
local duration = math.abs(target - currentAlpha) * 0.2
local tween = _TweenLogic:MakeTween(currentAlpha, target, duration, EaseType.Linear, function(v)
	canvas.GroupAlpha = v		
end)
tween:SetOnEndCallback(function()
	self.FadeTween = nil		
end)
tween.AutoDestroy = true
tween:Play()
self.FadeTween = tween
end