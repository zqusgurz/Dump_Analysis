return function (self) 
local obj = self.Dragging
if (obj == nil) then
	return

end
if not (isvalid(obj)) then
	self:CancelDrag(false)
	return
end
if (self._touchedTime > 0) then
	self._touchedTime -= 0.1
	if (self._touchedTime < 0) then
		--log("no droppable")
		self:CancelDrag(false)
	end
else
	self:MoveToCursor()
end
end