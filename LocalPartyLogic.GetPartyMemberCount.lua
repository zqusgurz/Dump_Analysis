return function (self) 
local party = self.LocalParty
if (not party) then
	return 0
end
return _PartyLogic:GetPartyMemberCount(party)
end