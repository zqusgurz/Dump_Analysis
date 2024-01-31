return function (self,id) 
---@type Party
local party = self.LocalParty
if (party == nil) then
	return false
end
if (id == nil) then
	id = _UserService.LocalPlayer.WsUser.CharacterId
end
return party.Leader == id
end