return function (self,from,lt,rb,parties) 
---@type Party
local party
if (self:IsClient()) then
	party = _LocalPartyLogic.LocalParty
else
	party = _PartyLogic.Parties[from.WsUser.PartyId]
end
local members = _PartyLogic:FindPartyMemberInLtRb(party, from, lt, rb, from.WsUserController:IsFacingLeft())
table.move(members, 1, #members, 1, parties)
end