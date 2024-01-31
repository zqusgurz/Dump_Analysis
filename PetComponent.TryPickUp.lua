return function (self,d) 
local owner = self.Owner
if (_ItemDropLogic:CheckDropOwner(d.OwnType, d.OwnId, d.CreateTime, owner, true)) then
	local map = self.Entity.CurrentMap
	local pp = self.Entity.TransformComponent.WorldPosition
	map.DropPoolComponent:PickUp(owner, d.DropId, 1, pp, owner.TransformComponent.WorldPosition)
	if (self.SweepTargetId == d.DropId) then
		self.SweepTarget = nil
		self.SweepTargetId = 0
	end
end
end