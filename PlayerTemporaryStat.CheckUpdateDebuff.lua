return function (self) 
local now = _UtilLogic.ServerElapsedSeconds
local function check(stat)
	if (self:GetValue(stat) ~= 0 and self:GetExpire(stat) <= now) then
		return true
	end
	return false
end

if (check(_CTS.Seal) or check(_CTS.Darkness) or check(_CTS.Weakness) or check(_CTS.Stun) or
	check(_CTS.Curse) or check(_CTS.Poison) or check(_CTS.Slow) or check(_CTS.Attract) or
	check(_CTS.BanMap)) then
	self:CheckUpdateCancelStat()
end
end