return function (self,event) 
if (not _InputUtils:IsTouch(event.TouchId)) then
	if (_AppService:Get().ToolTipMan:IncRefCountAndCheck(self.Entity)) then
		if (isvalid(_DragDropLogic.Dragging)) then
			return
		end
		self:MakeTooltip()
	end
end
end