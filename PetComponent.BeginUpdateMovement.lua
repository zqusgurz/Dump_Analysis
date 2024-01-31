return function (self) 
self.UpdateMovementTimer = _TimerService:SetTimerRepeat(self.UpdateMovement, 0.1, 0)
end