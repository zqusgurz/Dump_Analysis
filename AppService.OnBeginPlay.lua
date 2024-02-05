return function (self) 
self._T.UpdateTimer = _TimerService:SetTimerRepeat(self.CheckUpdateFlag, 0.1)
end