return function (self,user,teleport) 
teleport.Valid = false
local move = user.MovementComponent
local rb = user.RigidbodyComponent
if (move.EnableInHierarchy) then
	move:SetWorldPosition(teleport.Position)
else
	rb:SetWorldPosition(teleport.Position)
end
if (teleport.ByPortal) then
	local fromPos = teleport.From
	self:ShowTeleportEffect(user, fromPos, false)
	user.WsUser:ShowTeleportEffect(fromPos, false, nil)
else
	self:ShowTeleportEffect(user, Vector3.zero, true)
	user.WsUser:ShowTeleportEffect(Vector3.zero, true, nil)
end
teleport.CoolTimeEnd = 0.6 + teleport.Start
end