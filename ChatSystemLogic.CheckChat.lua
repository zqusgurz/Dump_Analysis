return function (self,user,message) 
local len = _Slangs:GetStringByteLength(message)
if (len <= _Slangs.MinInclusiveLength or len > _Slangs.MaxExclusiveLength) then
	log_warning("length error")
	return false
end
local u = user.WsUser
if (DateTime(u.ForbidChatTill) > DateTime.UtcNow) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, "대화 금지 상태이므로 채팅이 불가능합니다.")
	return false
end
local now = _UtilLogic.ElapsedSeconds
if (now < self.BlockedTooFastChat) then
	return false
end

if (now - self.LastChatTime < 3.5) then
	if (self.TooFastChat >= 5) then
		self.BlockedTooFastChat = now + 3.5
		self.TooFastChat = 0
		_UtilDlgLogic:Show("너무 많은 대화는 다른 사용자에게\n피해가 될 수 있습니다.")
		return false
	else
		self.TooFastChat = self.TooFastChat + 1
	end
else
	self.TooFastChat = math.floor(math.max(self.TooFastChat - ((now - self.LastChatTime) / 3.5), 0))
end
self.LastChatTime = now

if (self.LastMessage == message) then
	if (self.EqualChat >= 2) then
		_UtilDlgLogic:Show("같은 말을 반복하는 것은\n다른 사용자에게 피해가 될 수 있습니다.")
		return false
	else
		self.EqualChat = self.EqualChat + 1
	end
else
	self.EqualChat = 1
end
self.LastMessage = message
return true
end