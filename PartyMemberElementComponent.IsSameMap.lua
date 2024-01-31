return function (self) 
if (_UtilLogic:IsNilorEmptyString(self.CharacterId)) then
	return true
end
return self.CurrentMap == _UserService.LocalPlayer.CurrentMapName
end