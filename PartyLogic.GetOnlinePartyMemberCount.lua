return function (self,party) 
local ret = 0
for i=1,self.MaxPartyMember do
	---@type PartyMember
	local mem = party.Member[i]
	if (mem and mem.Map ~= _PartyMemberMap.Offline) then
		ret += 1
	end
end
return ret
end