return function (self) 
-- log("Dropped to field")
local obj = self.Dragging
if (isvalid(obj)) then
	local d = obj.DraggingComponent
	if (d.ObjectType == _DraggableObjectType.Item) then
		_ItemDropLogic:DoDrop(d.HoldingObject)
	end
end
self:CancelDrag(false)
end