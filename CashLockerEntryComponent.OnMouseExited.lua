return function (self,pos) 
if (_AppService:Get().ToolTipMan:DecRefCountAndCheck(self.Entity)) then
	self:RemoveTooltip()
end
end