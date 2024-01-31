return function (self) 
if (self._T.Clicked ~= nil and _UtilLogic.ElapsedSeconds - self._T.Clicked < 0.45) then
	_DragDropLogic:CancelDrag(false)
	self:OnDoubleClicked()
else
	self._T.Clicked = _UtilLogic.ElapsedSeconds
end
end