return function (self,user,skillId,slv) 
local ts = user.PlayerTemporaryStat
if (ts:GetValue(_CTS.DarkSight) > 0 and ts:GetReason(_CTS.DarkSight) == skillId) then
	_UserSkillLogic:TryCancelTemporaryStat(user, skillId)
	return true
end
return false
end