return function (self,leftMap) 
if (self.UpdateMovementTimer > 0) then
	_TimerService:ClearTimer(self.UpdateMovementTimer)
	self.UpdateMovementTimer = 0
end
end