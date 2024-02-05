return function (self) 
if (self.LoginButton.FunctionButtonComponent.Enable) then
	if (self.LastTriedLogin + 1 > _UtilLogic.ElapsedSeconds) then
		--log("Too fast login")
		return
	end
	if (self.LoginError.EnabledInHierarchy) then
		--log("Already login error")
		return
	end
	self.LastTriedLogin = _UtilLogic.ElapsedSeconds
	self.LoginButton.FunctionButtonComponent:SetInteractible(false)
	_UserService.LocalPlayer.PlayerTemporaryStat:Clear()
	self:OnCheckLogin_Server()
end
end