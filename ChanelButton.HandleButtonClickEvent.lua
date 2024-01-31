return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ButtonComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Entity = event.Entity
---------------------------------------------------------
if self.NewValue1 then
	_CurrentUsers:TeleportUser(_UserService.LocalPlayer.PlayerComponent.UserId, self.id)
else
	self.NewValue1 = true
	_TimerService:SetTimerOnce(function()
		self.NewValue1 = false
		end,0.5)
end


end