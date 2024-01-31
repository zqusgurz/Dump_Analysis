return function (self) 
local timer = self.AnimationTimer
if (timer ~= -1) then
	_TimerService:ClearTimer(timer)
	self.AnimationTimer = -1
end
end