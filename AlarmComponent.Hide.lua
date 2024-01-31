return function (self,instant) 
self:CancelTween()
_TimerService:ClearTimer(self._TimeoutTimer)
if (not instant) then
	local e = self.Entity
	local canvas = e.CanvasGroupComponent
	canvas.GroupAlpha = 1
	local tween = _TweenLogic:MakeTween(1, 0, 1, EaseType.Linear, function(val)
		canvas.GroupAlpha = val
	end)
	tween.AutoDestroy = true
	tween:SetOnEndCallback(function()
		self._T.Tween = nil
		self:OnRelease()
	end)
	tween:Play()
	self._T.Tween = tween
else
	self:OnRelease()
end
self:OnHide()
end