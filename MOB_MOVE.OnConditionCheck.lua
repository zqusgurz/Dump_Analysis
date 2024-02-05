return function (self,nextStateName) 
if (nextStateName == _MobAction.Jump) then
	local rb = self.ParentComponent.Entity.RigidbodyComponent
	if (rb.IsolatedMove) then
		return false
	end
	if (rb.RealMoveVelocity.y < 0) then
		return true
	end
end
return false
end