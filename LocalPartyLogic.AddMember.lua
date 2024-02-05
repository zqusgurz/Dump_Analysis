return function (self,pos,member) 
---@type table<PartyMember>
local members = self.LocalParty.Member
members[pos] = member
end