return function (self,set,delay) 
local function run()
	self:ClearDelayedTimer()

	if (delay > 0) then
		self.DelayedUpdateTimer = _TimerService:SetTimerOnce(function()
			self:_UpdateAffectedSkillList(false)
		end, delay)
	else
		self:_UpdateAffectedSkillList(false)
	end
end

for k,_ in pairs(_UserAffectedEffects.List) do
	if (set[k]) then
		run()
		return
	end
end

-- set에 _UserAffectedEffects.List에 포함된 갱신할 스탯이 없었다면.... 아무 것도 하지 마!!
end