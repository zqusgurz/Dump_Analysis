return function (self,sender,channelName,rawMessage,id,hash) 
if (not _AppService:Get().ChatSystem.ShowWhisper) then
	return
end
local message = self:FilterSlangs(rawMessage)
if (channelName) then
	_ChatMessageLogic:Add(_ChatMessageType.Whisper, string.format("%s[CH.%s]>> %s", sender, channelName, message))
else
	_ChatMessageLogic:Add(_ChatMessageType.Whisper, string.format("%s>> %s", sender, message))
end
_AppService:Get().ChatSystem.LastReceivedWhisperFrom = sender
self:InsertLog(sender, rawMessage, id, hash)
end