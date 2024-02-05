return function (self) 
local newState = not self.ChatLog.SpreadChatLog
self:SetEnabledChatInput(newState)
self.ChatLog:SetSpreadChatLogAndReposition(newState)
end