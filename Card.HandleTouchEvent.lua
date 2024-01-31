return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: TouchReceiveComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local TouchId = event.TouchId
local TouchPoint = event.TouchPoint
---------------------------------------------------------
local board = self.Entity.Parent.FindPicture
board:choseCard(self.Entity, _UserService.LocalPlayer)
end