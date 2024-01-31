return function (self,user,argc,args) 
if (argc < 2) then
	return false
end
if (string.lower(user.WsUser.FullName) == string.lower(args[2])) then
	return false
end
if (_ChatSystemLogic.ProcessingWhisperOnClient > _UtilLogic.ElapsedSeconds) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, "다른 요청을 처리중입니다.")
	return false
end
_ChatSystemLogic.ProcessingWhisperOnClient = _UtilLogic.ElapsedSeconds + 3
_UserDictionary:DoFind(user, args[2])
return true
end