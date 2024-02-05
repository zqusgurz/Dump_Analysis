return function (self,nextStateName) 
local mob = self.ParentComponent.Entity
if (nextStateName == _MobAction.Move) then
	if (mob.MobAIComponent.InputX == 0) then
		return false
	end
	if (mob.RigidbodyComponent:GetCurrentFoothold()) then
		return true
	end
elseif (nextStateName == _MobAction.Stand) then
	if (mob.MobAIComponent.InputX ~= 0) then
		return false
	end
	if (mob.RigidbodyComponent:GetCurrentFoothold()) then
		return true
	end
end
return false
end