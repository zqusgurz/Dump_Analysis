return function (self,delay) 
self:ClearDelayedTimer()

if (delay > 0) then
	self.DelayedUpdateTimer = _TimerService:SetTimerOnce(function()
		self:_UpdateAffectedSkillList()
	end, delay)
else
	self:_UpdateAffectedSkillList()
end
end