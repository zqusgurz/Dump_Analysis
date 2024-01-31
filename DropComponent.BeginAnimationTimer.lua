return function (self,func) 
self:ClearAnimationTimer()
self.AnimationTimer = _TimerService:SetTimerRepeat(func, 0.03)
end