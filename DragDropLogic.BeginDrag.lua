return function (self,from) 
local type = from:GetObjectType()
local obj = from:GetHoldingObject()
if (type < 0 or not isvalid(obj)) then
	return
end
self.Dragging = obj.Entity
self:MoveToCursor(obj.Entity)
_SoundService:PlaySound(self.DragDropSounds["DragStart"], 1)
from:OnBeginDrag()
end