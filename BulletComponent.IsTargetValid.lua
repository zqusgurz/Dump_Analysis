return function (self) 
local target = self.Target
if (not isvalid(target)) then
	return false
end
if (not target.Enable or not target.Visible) then
	return false
end
local mob = target.MobComponent
if (isvalid(mob)) then
	if (target.StateComponent.CurrentStateName == _MobAction.Die1) then
		return false
	end
end
return true
end