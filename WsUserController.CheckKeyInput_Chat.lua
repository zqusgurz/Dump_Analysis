return function (self) 
if (_InputManager:IsPressed(_FuncKeySystemType.Whisper)) then
	self:MarkNoKeyChatInputFuncKey()
	_AppService:Get().ChatSystem:OpenWhisperTargetInput()
end
if (_InputManager:IsPressed(_FuncKeySystemType.ChattingPlus)) then
	self:MarkNoKeyChatInputFuncKey()
	_AppService:Get().ChatSystem:ToggleChatSpread()
end
if (_InputManager:IsPressed(_FuncKeySystemType.ToAll)) then
	self:MarkNoKeyChatInputFuncKey()
	_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToAll, nil)
	_AppService:Get().ChatSystem:FocusChatInput("")
end
if (_InputManager:IsPressed(_FuncKeySystemType.ToParty)) then
	self:MarkNoKeyChatInputFuncKey()
	_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToParty, nil)
	_AppService:Get().ChatSystem:FocusChatInput("")
end
if (_InputManager:IsPressed(_FuncKeySystemType.ToFriend)) then
	self:MarkNoKeyChatInputFuncKey()
	_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToWorld, nil)
	_AppService:Get().ChatSystem:FocusChatInput("")
end
end