return function (self,party,id) 
for i=1,self.MaxPartyMember do
	---@type PartyMember
	local mem = party.Member[i]
	if (mem and mem.Id == id) then
		return true
	end
end
return false
end