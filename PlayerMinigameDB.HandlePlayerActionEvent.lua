return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: PlayerControllerComponent
-- Space: Server, Client
---------------------------------------------------------

-- Parameters
local ActionName = event.ActionName
local PlayerEntity = event.PlayerEntity
---------------------------------------------------------
local me = _UserService.LocalPlayer

if ActionName == "Minigame" then
	self:LeaveGame(ActionName, self.gameboard, me)
	me.PlayerControllerComponent:RemoveActionKey(KeyboardKey.DownArrow)
	self.gameboard = nil
end
end