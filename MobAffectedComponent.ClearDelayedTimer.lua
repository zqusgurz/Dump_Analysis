return function (self) 
if (self.DelayedUpdateTimer ~= -1) then
	_TimerService:ClearTimer(self.DelayedUpdateTimer)
	self.DelayedUpdateTimer = -1
end
end