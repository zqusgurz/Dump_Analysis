return function (self) 
local user = self.Entity
if (not user.WsUser.Loaded) then
	return
end
local state = user.StateComponent.CurrentStateName
--if (state ~= "JUMP" and state ~= "FALL") then
--    self.FallDownTick = 0
--    return
--end
local rb = user.RigidbodyComponent
if (rb:IsOnGround() or _CharacterActionLogic:IsOnLadderOrRope(state)) then
	self.FallDownTick = 0
	return
end
local velocityY = user.RigidbodyComponent.RealMoveVelocity.y
if (velocityY < -0.1) then
	self.FallDownTick += 1
	--log(string.format("FallDownTick: %d", self.FallDownTick))
else
	self.FallDownTick = 0
end
end