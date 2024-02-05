return function (self,id) 
---@type Party
local party = _LocalPartyLogic.LocalParty
if (party) then
	local oldLeader = party.Leader
	party.Leader = id
	self:UpdatePartyMemberMinimap(oldLeader)
	self:UpdatePartyMemberMinimap(id)
	self.Offline:UpdateLeaderIcon(id)
	self.Online:UpdateLeaderIcon(id)
	self:UpdateButton()
end
end