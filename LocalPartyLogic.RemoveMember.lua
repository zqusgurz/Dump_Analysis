return function (self,id) 
---@type table<PartyMember>
local members = self.LocalParty.Member
for i=1,_PartyLogic.MaxPartyMember do
	if (members[i].Id == id) then
		members[i] = nil
		break
	end
end
end