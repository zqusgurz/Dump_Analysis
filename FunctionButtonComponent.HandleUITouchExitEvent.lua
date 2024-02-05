return function (self,event) 
if (not _InputUtils:IsTouch(event.TouchId)) then
	if (_AppService:Get().ToolTipMan:DecRefCountAndCheck(self.Entity)) then
		self:RemoveTooltip()
	end
end
end