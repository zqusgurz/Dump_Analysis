return function (self,pos) 
local obj = _DragDropLogic.Dragging
_ControlWindowLogic:SetFocusOnTab(self.Entity)
if (isvalid(obj)) then
	local d = obj.DraggingComponent
	if (d.From.Id == self.Entity.Id and _UtilLogic.ElapsedSeconds - d.Created < 0.45) then
		_DragDropLogic:CancelDrag(false)
		self:OnDoubleClicked()
	else
		_DragDropLogic:SetActivateDragDroppable(self)		
	end
else
	_DragDropLogic:BeginDrag(self)
end
end