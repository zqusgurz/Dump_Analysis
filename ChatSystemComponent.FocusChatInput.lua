return function (self,defaultText) 
if (not self.EnabledChatInput) then
	self:SetEnabledChatInput(true)
	self.ChatLog:RepositionChatLog()
end

local chatInputText = self.ChatInputText
chatInputText.TextComponent.Text = defaultText
chatInputText.TextInputComponent.Text = defaultText
chatInputText.TextInputComponent:ActivateInputField()
self:BlockReturnKey()
_InputManager:RemoveAllPressed()

--log("Focus Chat Input")
end