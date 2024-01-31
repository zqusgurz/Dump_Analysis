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
self:OnMouseEntered(event.TouchPoint)
end