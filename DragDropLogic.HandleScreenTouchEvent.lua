return function (self,event) 
if not (_InputUtils:IsPrimaryButton(event.TouchId)) then
	return
end
if (isvalid(self.Dragging)) then
	local d = self.Dragging.DraggingComponent
	if (_UtilLogic.ElapsedSeconds -  d.Created < self.DropThresholdTime) then
		return
	end
	if not (_InputService:IsPointerOverUI()) then
		self:DroppedToField()
		self:CancelDrag(false)
	else
		if (self._touchedTime == 0) then
			self._touchedTime = self.DropThresholdTime
--			log("Screen Touched", self._touchedTime)
		end
	end
end
if (not _InputService:IsPointerOverUI()) then
	_AppService:Get():CloseMenus()
end
end