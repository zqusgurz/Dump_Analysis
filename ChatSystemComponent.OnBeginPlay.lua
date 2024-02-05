return function (self) 
self.ChatTargetButton:ConnectEvent(ButtonClickEvent, function()
	self.ChatTargetList.Enable = not self.ChatTargetList.Enable
end)
self.TargetButton_ToAll:ConnectEvent(ButtonClickEvent, function()
	self:ChangeChatTarget(_ChatTargetType.ToAll, nil)
end)
self.TargetButton_ToWhisper:ConnectEvent(ButtonClickEvent, function()
	self:OpenWhisperTargetInput()
end)
self.TargetButton_ToParty:ConnectEvent(ButtonClickEvent, function()
	self:ChangeChatTarget(_ChatTargetType.ToParty, nil)
end)
self.TargetButton_ToWorld:ConnectEvent(ButtonClickEvent, function()
	self:ChangeChatTarget(_ChatTargetType.ToWorld, nil)
end)
self.ChatInputText:ConnectEvent(TextInputSubmitEvent, function(event)
	self:OnSubmitChat(event)
end)
self.ChatInputText:ConnectEvent(TextInputEndEditEvent, function(event)
	if (not self.ChatLog.SpreadChatLog) then
		self:SetEnabledChatInput(false)
		self.ChatLog:RepositionChatLog()
	end
	self.TypingTime = _UtilLogic.ElapsedSeconds + 0.2
end)
self.ChatInputText:ConnectEvent(TextInputValueChangeEvent, function(event)
	self:BlockReturnKey()
end)

if (_DebugConstants:IsMobile()) then
	local xOffset = 220
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, 561 - xOffset, nil)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity_ChatInputRoot, 562 - xOffset, nil)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.ChatInputText, 426 - xOffset, nil)
	self.ChatInputText.TextInputComponent.PlaceHolder = "채팅을 입력하려면 터치하세요."
	self.ChatInputText.TextComponent.FontColor = Color.white
end

self.ChatTargetList.Enable = false

-- TODO 옵션에서 불러오기
-- 지금은 Spread되지 않은 상태가 기본값
if (_DebugConstants:IsMobile()) then
	self:SetEnabledChatInput(true)
	self.ChatLog:SetSpreadChatLogAndReposition(true)
	self:ChangeChatTarget(_ChatTargetType.ToAll, nil)
else
	self:SetEnabledChatInput(true)
	self.ChatLog:SetSpreadChatLogAndReposition(true)
	self:ChangeChatTarget(_ChatTargetType.ToAll, nil)
    --self:SetEnabledChatInput(false)
    --self.ChatLog:SetSpreadChatLogAndReposition(false)
    --self:ChangeChatTarget(_ChatTargetType.ToAll, nil)
end
end