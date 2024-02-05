return function (self,state) 
if (state ~= "CLIMB" and state ~= "LADDER") then
	return true
end
local player = _UserService.LocalPlayer
if (player.RigidbodyComponent.MoveVelocity.x == 0) then
	return false
end
return true
end