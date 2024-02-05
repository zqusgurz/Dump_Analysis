return function (self,hitByLeft,forceDetach) 
local action = self.Entity.CharacterActionComponent
local controller = self.Entity.PlayerControllerComponent
local rb = self.Entity.RigidbodyComponent
if (isvalid(action)) then
	local curState = self.Entity.StateComponent.CurrentStateName
	local move = self.Entity.MovementComponent
	if (curState == "CLIMB" or curState == "LADDER") then
		if (forceDetach or not _InputManager:IsPressed(_FuncKeySystemType.Up)) then
			action.NextClimbAvailableWhenOnGround = true
			action.NextClimbAvailable = _UtilLogic.ElapsedSeconds + 2147483647
			action:UpdateClimbableAvailable()
			move:Jump()
		end
	end
end
end