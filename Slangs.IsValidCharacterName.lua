return function (self,name) 
local len = _Slangs:GetStringByteLength(name)
if (len == 0) then
	return false
end
if (len < 4 or len > 12) then
    _ChatMessageLogic:Add(_ChatMessageType.Red, "잘못된 아이디입니다.")
    return false
end
local regex = Regex("^[0-9a-zA-Z가-힣]*$")
if (not regex:IsMatch(name)) then
    _ChatMessageLogic:Add(_ChatMessageType.Red, "잘못된 아이디입니다.")
    return false
end
return true
end