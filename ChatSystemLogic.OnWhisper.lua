return function (self,sender,worldId,message) 
if (not _AppService:Get().ChatSystem.ShowWhisper) then
	return
end

message = self:FilterSlangs(message)
if (worldId) then
	_ChatMessageLogic:Add(_ChatMessageType.Whisper, string.format("%s[CH.%s]>> %s", sender, worldId, message))
else
	_ChatMessageLogic:Add(_ChatMessageType.Whisper, string.format("%s>> %s", sender, message))
end
_AppService:Get().ChatSystem.LastReceivedWhisperFrom = sender
end