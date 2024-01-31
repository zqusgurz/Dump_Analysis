return function (self) 
local obj = _DragDropLogic.Dragging
if (isvalid(obj)) then
	_DragDropLogic:CancelDrag(false)
end
end