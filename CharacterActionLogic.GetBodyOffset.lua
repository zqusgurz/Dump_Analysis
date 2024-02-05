return function (self,p) 
local pState = p.StateComponent.CurrentStateName
local bc = _CharacterActionLogic:GetBodyRect(pState == "PRONE" or pState == "PRONESTAB")
if (p.WsUserController.LookDirectionX == 1) then
	return Vector3(-bc.x, bc.y, 0)
else
	return Vector3(bc.x, bc.y, 0)
end
end