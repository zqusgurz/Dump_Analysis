return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: StateComponent
-- Space: Server, Client
---------------------------------------------------------

-- Parameters
local CurrentStateName = event.CurrentStateName
local PrevStateName = event.PrevStateName
---------------------------------------------------------
if self.Entity ~= _UserService.LocalPlayer then return end
if CurrentStateName == "SIT" or PrevStateName == "SIT" then
	if CurrentStateName == "SIT" then
		self:SitState(_UserService.LocalPlayer.PlayerControllerComponent.LookDirectionX, true)
	else
		self:SitState(_UserService.LocalPlayer.PlayerControllerComponent.LookDirectionX, false)
	end
end
end