return function (self,payload) 
---@type Party
local party = payload
if (party) then
	-- log("Set local party... id: ", party.Id)
else
	-- log("Set local party to nil...")
end	
self.LocalParty = party
_AppService:Get().ControlWindowMan.UserList.UserListComponent.Party:UpdateParty()
end