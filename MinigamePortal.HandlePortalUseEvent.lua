return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: PortalComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local PortalUser = event.PortalUser
---------------------------------------------------------
if self.Entity.Name == "MinigamePortal3" then
	_MinigameManager:JoinGame("Gomoku", _UserService.LocalPlayer)
elseif self.Entity.Name == "MinigamePortal4" then 
	_MinigameManager:JoinGame("Othello", _UserService.LocalPlayer)
elseif self.Entity.Name == "MinigamePortal5" then 
	_MinigameManager:JoinGame("Gomoku2", _UserService.LocalPlayer)
elseif self.Entity.Name == "MinigamePortal1" then 
	_MinigameManager:JoinGame("SamePicture", _UserService.LocalPlayer)
end
end