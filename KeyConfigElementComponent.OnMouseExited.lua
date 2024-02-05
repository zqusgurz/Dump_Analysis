return function (self,pos) 
if (_AppService:Get().ToolTipMan:DecRefCountAndCheck(self.Entity)) then
	self:RemoveToolTip()
end
end