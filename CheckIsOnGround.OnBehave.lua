return function (self,delta) 
local parent = self.ParentAI.Entity
local rb = parent.AdvancedRigidbodyComponent
if (rb:IsOnGround()) then
	return BehaviourTreeStatus.Success
end
return BehaviourTreeStatus.Failure
end