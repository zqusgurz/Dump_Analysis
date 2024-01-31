return function (self,sender,message,id,hash) 
local logs = self.LocalChatLog
logs[#logs + 1] = {
	Sender = sender,
	Message = message,
	Id = id,
	Hash = hash
}
if (#logs > 200) then
	table.remove(logs, 1)
end
end