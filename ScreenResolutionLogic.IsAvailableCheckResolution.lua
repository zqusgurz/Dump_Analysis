return function (self) 
local readyFlag = self.CreateUIReadyFlag
if ((readyFlag & _Constants.CreateFlag_ControlWindow) == 0) then
	return false
end
if ((readyFlag & _Constants.CreateFlag_StatusBar) == 0) then
	return false
end
if ((readyFlag & _Constants.CreateFlag_ScreenMsg) == 0) then
	return false
end
if (not _UserService.LocalPlayer.PlayerOptionComponent.Loaded) then
	return false
end
return true
end