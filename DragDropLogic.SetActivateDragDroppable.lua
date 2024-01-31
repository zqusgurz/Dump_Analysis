return function (self,droppable) 
if (self._touchedTime == 0) then
	--log("Touchedtime == 0??")
	return
end
local obj = self.Dragging
local success = false
if (isvalid(obj)) then
--	log("OnDrop!", droppable.Entity, obj)
	droppable:OnDrop(obj)
	success = true
else
	log("why obj is not vaild?")
end
self:CancelDrag(success)
end