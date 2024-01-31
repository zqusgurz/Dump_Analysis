return function (self,party,callback) 
for i=1,self.MaxPartyMember do
	---@type PartyMember
	local mem = party.Member[i]
	if (mem) then
		callback(mem)
	end
end
end