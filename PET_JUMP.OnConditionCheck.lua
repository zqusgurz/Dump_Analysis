return function (self,nextStateName) 
if (nextStateName == "IDLE") then
	return self.ParentComponent.Entity.RigidbodyComponent:GetCurrentFoothold() == nil
end
return true
end