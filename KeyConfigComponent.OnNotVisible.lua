return function (self) 
self:InvalidatePosition()
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.KeySet))
_DragDropLogic:CancelDragIfTypeMatched(_DraggableObjectType.FuncKey, 0)
_DragDropLogic:CancelDragIfTypeMatched(_DraggableObjectType.FuncSystemKeyPlaceholder, 0)
end