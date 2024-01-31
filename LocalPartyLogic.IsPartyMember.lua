return function (self,id) 
---@type Party
local party = self.LocalParty
if (party == nil) then
	return false
end
return _PartyLogic:IsPartyMember(party, id)
end