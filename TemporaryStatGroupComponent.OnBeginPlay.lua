return function (self) 
self._T.Timer = _TimerService:SetTimerRepeat(self.Update, 0.5, 0.5)
end