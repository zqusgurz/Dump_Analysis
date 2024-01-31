return function (self) 
if (_FieldAttributeLogic:IsHiddenUI(nil)) then
	return true
end
local localPlayer = _UserService.LocalPlayer
if (localPlayer == nil) then
	return true
end
if (not localPlayer.WsUser.Loaded) then
	return true
end 
end