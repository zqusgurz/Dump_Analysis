return function (self) 
local user = self.Entity
local state = user.StateComponent
local currentState = state.CurrentStateName
if (not _UserRecoveryLogic:CheckEndureOnRope(user, currentState)) then
	return
end
local now = _UtilLogic.ElapsedSeconds
if (not user.MovementComponent.IsClimbPaused) then
	self.LastRestHpChanged[1] = now
	self.LastRestMpChanged[1] = now
	--log("update last rest endure rope changed")
end
end