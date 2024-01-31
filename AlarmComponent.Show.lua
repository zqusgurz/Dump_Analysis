return function (self) 
self:CancelTween()
local e = self.Entity
local canvas = e.CanvasGroupComponent
canvas.GroupAlpha = 0
_UpdateComponentLogic:InsertUpdateVisible(e)
local tween = _TweenLogic:MakeTween(0, 1, 1, EaseType.Linear, function(val)
	canvas.GroupAlpha = val
end)
tween.AutoDestroy = true
tween:SetOnEndCallback(function()
	self._T.Tween = nil		
end)
tween:Play()
_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/Invite"), 1)
self._T.Tween = tween
self._TimeoutTimer = _TimerService:SetTimerOnce(self.OnButtonCancel, self.Timeout)
end