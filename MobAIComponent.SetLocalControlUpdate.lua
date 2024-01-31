return function (self,b,delay) 
_TimerService:ClearTimer(self.LocalMobControllingUpdate)
if (b) then
	self.LocalMobControllingUpdate = _TimerService:SetTimerRepeat(self.UpdateMob, 0.2, delay)
end
end