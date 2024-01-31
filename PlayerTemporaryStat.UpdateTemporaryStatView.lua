return function (self,stats,set) 
local ts = _AppService:Get().TemporaryStat
if (set) then
	local statTable = {}
	local durationTable = {}
	for i=1,#stats do
		local stat = stats[i]
		local reason = self:GetReason(stat)
		local value = self:GetValue(stat)
		if (value ~= 0 and reason ~= 0) then
			-- First create sub table
			if (statTable[reason] == nil) then
				statTable[reason] = {}
				durationTable[reason] = self:GetExpire(stat) - _UtilLogic.ServerElapsedSeconds
			end
			-- Add stat to reason sub table
			local sub = statTable[reason]
			sub[#sub + 1] = stat
		end
	end
	for r, tab in pairs(statTable) do
		-- log(string.format("Set stat reason:%d duration:%.2f", r, durationTable[r]), tab)
		ts:Add(r, durationTable[r], tab)
	end
else
	for i=1,#stats do
		-- log(string.format("Reset stat stat:%d", stats[i]))
		ts:RemoveStat(stats[i])
	end
end
end