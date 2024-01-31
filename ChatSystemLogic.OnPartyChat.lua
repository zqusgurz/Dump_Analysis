return function (self,sender,rawMessage,id,hash) 
local message = self:FilterSlangs(rawMessage)
_ChatMessageLogic:Add(_ChatMessageType.Party, string.format("%s : %s", sender, message))
self:InsertLog(sender, rawMessage, id, hash)
end