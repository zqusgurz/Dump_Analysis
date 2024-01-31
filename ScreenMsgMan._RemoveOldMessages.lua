return function (self) 
local messages = self.MessageTable
local count = #messages
if (count >= self.MaxMessages) then
	for i=count,self.MaxMessages,-1 do
		---@type Entity
		local msg = messages[i]
		msg.ScreenMsgElement:End()
		self.Messages.ChildObjectPoolComponent:Release(msg)
		table.remove(messages, i)
	end
end
end