return function (self,event) 
if (event.Function == "Login") then
	self:OnLogin()
elseif (event.Function == "LoginErrorOk") then
	self:OnLoginErrorOk()
elseif (event.Function == "LoginErrorYes") then
	self:OnLoginErrorOk()
	local callback = self.LoginErrorPromptYesCallback
	if (callback) then
		callback()
		self.LoginErrorPromptYesCallback = nil
	end
elseif (event.Function == "LoginErrorNo") then
	self:OnLoginErrorOk()
	local callback = self.LoginErrorPromptNoCallback
	if (callback) then
		callback()
		self.LoginErrorPromptNoCallback = nil
	end
end
end