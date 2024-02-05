return function (self) 
if (not self.Enabled) then
	return nil
end
local func = {FuncType = _FuncKeyTypes.System, Id = self.Function}
local dragging = _DragDropLogic:CreateDragging(_DraggableObjectType.FuncSystemKeyPlaceholder, self.Entity, func, self.Sprite)
dragging.OnEndDragCallback = function(success)
	_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:InvalidatePosition()
end
return dragging
end