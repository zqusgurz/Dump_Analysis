return function (self,event) 
local e = event.TriggerBodyEntity
local group = e.TriggerComponent.CollisionGroup
if (group == CollisionGroups.MaplePortal) then
	local pt = e.MaplePortalComponent
	if (isvalid(pt)) then
		if (pt.Pt ~= _PortalType.StartPoint and pt.Pt ~= _PortalType.TownPortalPoint) then
			if (pt.Pt ~= _PortalType.Collision and pt.Pt ~= _PortalType.CollisionScript) then
				self._currentTriggeredPortal = pt
			end
		end
	end
end
end