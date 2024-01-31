return function (self,event) 
if (_UtilLogic:IsNilorEmptyString(event.Text)) then
	return
end
_TradingRoomLogic:OnSendChat(_UserService.LocalPlayer, event.Text)
self.ChatInput.TextInputComponent:ActivateInputField()
end