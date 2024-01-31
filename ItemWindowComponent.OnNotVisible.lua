return function (self) 
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Inven))
_DragDropLogic:CancelDragIfTypeMatched(_DraggableObjectType.Item, 1)
end