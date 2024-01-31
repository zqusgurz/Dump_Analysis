return function (self) 
if (self.LoginError.Enable) then
	self.LastTriedLogin = _UtilLogic.ElapsedSeconds
	self.LoginError.LoginErrorWindowComponent:Close()
	_TimerService:SetTimerOnce(function()
		self.LoginButton.FunctionButtonComponent:SetInteractible(true)
	end, 1)
end
end