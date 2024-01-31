return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: TouchReceiveComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local TouchId = event.TouchId
local TouchPoint = event.TouchPoint
---------------------------------------------------------
self:Click(_UserService.LocalPlayer)

end