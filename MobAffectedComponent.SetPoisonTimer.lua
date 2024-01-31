return function (self,enabled) 
if (enabled) then
	if (self.PoisonDamageTimer ~= -1) then
		return
	end
	local function showPoisonDamage()
		local entity = self.Entity
		local mts = entity.MobTemporaryStat
		local mob = entity.MobComponent
		local poison = mts:GetValue(_MTS.Poison)
		if (poison > 0) then
			mob:ShowPoisonDamage(poison)
		end
	end
	self.PoisonDamageTimer = _TimerService:SetTimerRepeat(showPoisonDamage, 1, 1)
else
	if (self.PoisonDamageTimer ~= -1) then
		_TimerService:ClearTimer(self.PoisonDamageTimer)
		self.PoisonDamageTimer = -1
	end
end
end