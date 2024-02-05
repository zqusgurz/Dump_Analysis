return function (self) 
local currentState = self.Entity.StateComponent.CurrentStateName
if (_InputManager:IsPressed(_FuncKeySystemType.Down)) then
	if (self:_IsChangableToProne(currentState)) then
		self.Entity.StateComponent:ChangeState("PRONE")
		self.Prone = true
		-- self:SetEnableMove(false)
		--log("Enable prone")
	end
else
	if (self.Prone and self:_IsReturnableFromProne(currentState)) then
		self.Prone = false
		self:ReturnToIdle()
		-- self:SetEnableMove(true)
		--log("Disable prone")
	end
end
end