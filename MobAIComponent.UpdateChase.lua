return function (self) 
local e = self.Entity
self.LocalStartChase = e.TransformComponent.WorldPosition:ToVector2()
local ma = e.MobComponent.MoveAbility
if (ma == _MoveAbility.None) then
	return
end
self.LocalUnchaseTick = 0
local rb = e.MobRigidbodyComponent
local fh = rb.LastFoothold
if (fh ~= 0) then
	self.LocalStartChaseZMass = e.CurrentMap.PlatformInfoComponent.ZMass[fh]
else
	local underFh = rb:GetFootholdUnderneath(0.01)
	if (underFh ~= 0) then
		self.LocalStartChaseZMass = e.CurrentMap.PlatformInfoComponent.ZMass[underFh]
	end
end
end