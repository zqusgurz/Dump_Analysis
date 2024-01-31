return function (self,nextStateName) 
if (nextStateName == "IDLE") then
	if (self.ParentComponent.Entity.PetComponent.ActionEnd > _UtilLogic.ServerElapsedSeconds) then
		return false
	end
end
return true
end