return function (self) 
---@type FinalAttackInfo
local info = self.FinalAttack
if (info == nil) then
	return false
end
local now = _UtilLogic.ElapsedSeconds
if (now < info.Start) then
    return false
end
--local state = self.Entity.StateComponent.CurrentStateName
--if (not _CharacterActionLogic:CanMeleeShootAttack(state)) then
--    return false
--end
local ret = _PlayerAttackLogic_FinalAttack:TryDoingFinalAttack(info.FinalAttackId, info.LastAttackId, info.WeaponType)
self.FinalAttack = nil
return ret
end