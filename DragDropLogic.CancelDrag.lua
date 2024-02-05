return function (self,success) 
local entity = self.Dragging
if (isvalid(entity)) then
	local callback = entity.DraggingComponent.OnEndDragCallback
	if (callback ~= nil) then
		callback(success)
	end
	entity:Destroy()
end
self.Dragging = nil
self._touchedTime = 0
--log("CanelDrag")
end