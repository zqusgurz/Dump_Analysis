return function (self,time) 
self.Entity.MovementComponent.Enable = false
-- 진짜 이러고 싶진 않았는데 아
_TimerService:SetTimerOnce(function()
	self.Entity.MovementComponent.Enable = true
end, time)
end