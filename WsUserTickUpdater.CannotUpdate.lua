return function (self) 
if (_FieldAttributeLogic:IsHiddenUI(nil)) then
	return true
end
local localPlayer = _UserService.LocalPlayer
if (localPlayer == nil) then
	return true
end
if (localPlayer.WsUser.Loaded == 0) then
	return true
end 
end