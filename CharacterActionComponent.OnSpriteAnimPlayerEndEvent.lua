return function (self,key,ev) 
if (self:PlayNextActionPiece(key)) then
	return
end

self.Registered[key] = nil
if (key ~= self.LocalBodyKey) then
	return
end

if (self.Prone) then
	--log("Return to prone")
	self.Entity.StateComponent:ChangeState("PRONE")
else
	--log("Return to idle")
	self:ReturnToIdle()
end
self.Entity.PlayerControllerComponent.FixedLookAt = 0
end