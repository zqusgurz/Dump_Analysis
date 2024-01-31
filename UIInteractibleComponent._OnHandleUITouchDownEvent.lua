return function (self,event) 
if (not self.InteractibleOnExclusiveAction) then
	if (_UserService.LocalPlayer.WsUser.ExclusiveAction) then
		return
	end
end
if (not self.InteractibleOnDied) then
	if (_UserService.LocalPlayer.WsUser:IsDied()) then
		self:OnCanceled()
		return
	end
end
--log("Touch Button", event.TouchId)
if (_InputUtils:IsPrimaryButton(event.TouchId)) then
	self:OnPrimaryButtonDown(event.TouchPoint)
elseif (_InputUtils:IsSecondaryButton(event.TouchId)) then
	self:OnSecondaryButtonDown(event.TouchPoint)
end
end