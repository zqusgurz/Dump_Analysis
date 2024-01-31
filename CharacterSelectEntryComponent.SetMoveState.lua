return function (self,moving) 
local event = BodyActionStateChangeEvent()
if (moving) then
	event.ActionState = MapleAvatarBodyActionState.Walk
else
	event.ActionState = MapleAvatarBodyActionState.Stand
end
self.Avatar:SendEvent(event)
end