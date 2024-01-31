return function (self,event) 
local user = _UserService.LocalPlayer

local text = _UtilLogic:Trim(event.Text, " ")
if (_UtilLogic:IsNilorEmptyString(text)) then
	if (not self.ChatLog.SpreadChatLog) then
		self:SetEnabledChatInput(false)
		self.ChatLog:RepositionChatLog()
	end
	return
end
if (text:sub(1, 1) == "/") then
	_CommandLogic:TryProcessCommand(text:sub(2))
	return
end

if (user.WsUser:IsOnJob()) then
	return
end

if (self.ChatTargetMode == _ChatTargetType.ToAll) then
	text = _Slangs:EscapeNonPrintable(text)
	if (not _ChatSystemLogic:CheckChat(user, text)) then
		return
	end
	_ChatSystemLogic:RequestGeneralChat(user, text)
elseif (self.ChatTargetMode == _ChatTargetType.ToWorld) then
	text = _Slangs:EscapeNonPrintable(text)
	if (not _ChatSystemLogic:CheckChannelChatInterval(user)) then
		_ChatMessageLogic:Add(_ChatMessageType.Red, "채널 채팅은 1분마다 한 번씩만 사용할 수 있습니다.")
		return
	end
	if (not _ChatSystemLogic:CheckChat(user, text)) then
		return
	end
	_ChatSystemLogic:RequestChannelChat(user, text)
elseif (self.ChatTargetMode == _ChatTargetType.ToParty) then
	text = _Slangs:EscapeNonPrintable(text)
	if (_LocalPartyLogic:GetOnlinePartyMemberCount() <= 1) then
		_ChatMessageLogic:Add(_ChatMessageType.Red, "가입하신 파티가 존재하지 않거나 로그인한 파티원이 없습니다.")
		return
	end
	if (not _ChatSystemLogic:CheckChat(user, text)) then
		return
	end
	_ChatMessageLogic:Add(_ChatMessageType.Party, string.format("%s : %s", user.WsUser.FullName, text))
	_ChatSystemLogic:RequestPartyChat(user, text)
	_ChatSystemLogic:InsertLog(user.WsUser.FullName, text, "", 0)
elseif (self.ChatTargetMode == _ChatTargetType.ToWhisper) then
	if (not _AppService:Get().ChatSystem.ShowWhisper) then
		_ChatMessageLogic:Add(_ChatMessageType.Whisper, "[시스템] 현재 귓속말 숨김 상태입니다.")
		return
	end
	if (self.WhisperTarget:lower() == user.WsUser.CharacterName:lower()) then
		return
	end
	text = _Slangs:EscapeNonPrintable(text)
	if (not _ChatSystemLogic:CheckChat(user, text)) then
		return
	end
	if (_ChatSystemLogic.ProcessingWhisperOnClient > _UtilLogic.ElapsedSeconds) then
		_ChatMessageLogic:Add(_ChatMessageType.Red, "다른 요청을 처리중입니다.")
		return
	end
	_ChatSystemLogic.ProcessingWhisperOnClient = _UtilLogic.ElapsedSeconds + 3
	_ChatMessageLogic:Add(_ChatMessageType.Whisper, string.format("%s<< %s", self.WhisperTarget, text))
	_ChatSystemLogic:RequestWhisper(user, text, self.WhisperTarget)
	_ChatSystemLogic:InsertLog(user.WsUser.FullName, text, "", 0)
end
end