return function (self,listCount) 
local entries = self.ChannelButtons
for i=listCount+1,#entries do
	---@type Entity
	local entry = entries[i]
	if (isvalid(entry)) then
		entry.Enable = false
	end
end
end