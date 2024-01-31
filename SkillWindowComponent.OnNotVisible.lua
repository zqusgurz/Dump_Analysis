return function (self) 
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Skill))
_DragDropLogic:CancelDragIfTypeMatched(_DraggableObjectType.Skill, 0)
end