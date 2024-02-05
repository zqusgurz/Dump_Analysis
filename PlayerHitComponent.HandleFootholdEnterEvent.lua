return function (self,event) 
local action = self.Entity.CharacterActionComponent
if (isvalid(action)) then
	if (action.NextClimbAvailableWhenOnGround) then
		local move = self.Entity.MovementComponent
		action.NextClimbAvailableWhenOnGround = false
		action.NextClimbAvailable = _UtilLogic.ElapsedSeconds + 0.3
		move.Enable = true
	end
end
end