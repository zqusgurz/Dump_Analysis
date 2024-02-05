return function (self,event) 
local e = event.TriggerBodyEntity
local group = e.TriggerComponent.CollisionGroup
if (group == CollisionGroups.MaplePortal) then
	local pt = e.MaplePortalComponent
	if (isvalid(pt)) then
		if (pt.Pt == _PortalType.Collision or pt.Pt == _PortalType.CollisionScript) then
			self:CheckPortalCollision(pt)
		end
	end
end

end