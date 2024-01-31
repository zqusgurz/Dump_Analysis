return function (self,e) 
_TimerService:ClearTimer(self.IdentifyTimer)
self.IdentifyTimer = -1
if (e ~= 0) then
	self.IdentifyNextRefresh = _UtilLogic.ElapsedSeconds + e
	self.IdentifyTimer = _TimerService:SetTimerRepeat(function()
		local timeout = self.IdentifyNextRefresh - _UtilLogic.ElapsedSeconds
		if (timeout < 0) then
			timeout = 0
			self:SetIdentifyTimer(0)
			self:RequestIdentify(_UserService.LocalPlayer, true)
		else
			self.IdentifyPopup.IdentifyPopupWindowComponent.CodeText.TextComponent.Text = self.CurrentCode
		end
		self.IdentifyPopup.IdentifyPopupWindowComponent.TimeoutText.TextComponent.Text = 
			string.format("%02d:%02d", math.floor(timeout / 60), math.floor(timeout % 60))
	end, 0.5)
end
end