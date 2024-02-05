return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: -
-- Space: Client
---------------------------------------------------------

-- Parameters
local Entity = event.Entity
local TouchId = event.TouchId
local TouchPoint = event.TouchPoint
---------------------------------------------------------

local parent = Entity.Parent
local beforePos = Entity.UITransformComponent.anchoredPosition
Entity:AttachTo(_EntityService:GetEntityByPath("/ui/ControlWindowGroup"))
Entity:AttachTo(parent)
Entity.UITransformComponent.anchoredPosition = beforePos

log(string.format("Touch Touch Down Event  Pos: %.2f, %.2f", TouchPoint.x, TouchPoint.y))
end