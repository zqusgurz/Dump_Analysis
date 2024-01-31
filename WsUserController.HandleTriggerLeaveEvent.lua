return function (self,event) 
local e = event.TriggerBodyEntity
local group = e.TriggerComponent.CollisionGroup
if (group == CollisionGroups.MaplePortal) then
	local pt = e.MaplePortalComponent
	if (pt == self._currentTriggeredPortal) then
		self._currentTriggeredPortal = nil
	end
end

end