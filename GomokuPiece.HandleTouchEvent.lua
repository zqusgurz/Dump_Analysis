return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: TouchReceiveComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local TouchId = event.TouchId
local TouchPoint = event.TouchPoint
---------------------------------------------------------
self.Entity.Parent.Parent.Gomoku:ClickPiece(self.x, self.y, _UserService.LocalPlayer)
end