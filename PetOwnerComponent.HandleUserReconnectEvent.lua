return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: UserService
-- Space: Server
---------------------------------------------------------

-- Parameters
local ReconnectMapName = event.ReconnectMapName
local TimeNetworkClosed = event.TimeNetworkClosed
local UserId = event.UserId
---------------------------------------------------------

local entity = self.Entity
if (isvalid(entity)) then
	if (UserId == entity.OwnerId) then
		local pet = self.Pet
		if (isvalid(pet)) then
			pet.PetComponent.WaitingForServer = false
		end
	end
end
end