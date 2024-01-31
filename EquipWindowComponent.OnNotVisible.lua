return function (self) 
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Equip))
_DragDropLogic:CancelDragIfTypeMatched(_DraggableObjectType.Item, -1)
end