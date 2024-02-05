return function (self,code,preservePopup,nextSecond) 
local popup = self.IdentifyPopup.IdentifyPopupWindowComponent
if (not preservePopup or not self.IdentifyPopup.Enable) then
	self:ShowIdentifyPopup(_UidMan:GetRawRUID("e331738f104b42cd99e35bfbe1abc6f7"), false)
end
self.CurrentCode = code
popup.TimeoutIcon.Enable = true
self:SetIdentifyTimer(nextSecond)
popup.CodeText.TextComponent.Text = self.CurrentCode
end