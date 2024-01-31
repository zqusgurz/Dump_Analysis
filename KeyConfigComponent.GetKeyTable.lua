return function (self) 
if (self:IsVisible()) then
	return self.TempKeySettings
end
return _InputManager.FuncKeyMapped
end