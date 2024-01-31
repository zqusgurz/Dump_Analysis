return function (self,sender,message,channel) 
message = _Slangs:EscapeNonPrintable(message)
if (sender ~= _UserService.LocalPlayer.WsUser.FullName) then
	message = self:FilterSlangs(message)
end
_ChatMessageLogic:AddSpeakerChannel(_ChatMessageType.SpeakerWorldInstance, sender, string.format("%s　　　: %s", sender, message), channel)
end