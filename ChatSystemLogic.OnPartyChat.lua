return function (self,sender,message) 
message = self:FilterSlangs(message)
_ChatMessageLogic:Add(_ChatMessageType.Party, string.format("%s : %s", sender, message))
end