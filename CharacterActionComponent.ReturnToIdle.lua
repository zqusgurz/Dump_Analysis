return function (self) 
local sc = self.Entity.StateComponent
local current = sc.CurrentStateName
if (_CharacterActionLogic:IsOnLadderOrRope(self.LastState)) then
	self.Entity.MovementComponent.Enable = true
end
if (_CharacterActionLogic:IsOnLadderOrRope(current)) then
	sc:ChangeState(self.LastState)
else
	if (self.Alert == true) then
		sc:ChangeState("ALERT")
	else
		sc:ChangeState("IDLE")
	end
end
end