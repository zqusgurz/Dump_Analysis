return function (self,sender,message) 
message = _Slangs:EscapeNonPrintable(message)
if (sender ~= _UserService.LocalPlayer.WsUser.FullName) then
	message = self:FilterSlangs(message)
end
_ChatMessageLogic:Add(_ChatMessageType.Channel, string.format("%s : %s", sender, message))
end