return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: InputService
-- Space: Client
---------------------------------------------------------

-- Parameters
local key = event.key
---------------------------------------------------------
if key == KeyboardKey.F1 then
	self:Function1(_UserService.LocalPlayer.PlayerComponent.UserId)
end
end