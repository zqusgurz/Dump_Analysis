return function (self) 
local entity = self.Entity
if (self.Migrating) then
	return true
end
if (self:IsServer()) then
	if (#entity.ScriptMachineComponent.CallScope > 0) then
		return true
	end
end
if (self.CurrentNpcShop ~= 0) then
	return true
end
if (self.TradeId > 0) then
	return true
end
if (self.OpeningLockerItem > _UtilLogic.ServerElapsedSeconds) then
	return true
end
-- TODO Check others..
return false
end