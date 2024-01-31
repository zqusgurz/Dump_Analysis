return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: TouchReceiveComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local TouchId = event.TouchId
local TouchPoint = event.TouchPoint
---------------------------------------------------------
self.Entity.Parent.Othello:PlacePiece(self.x, self.y, self.force)
self.Entity.Parent.Othello:RemoveCanPlaces()
end