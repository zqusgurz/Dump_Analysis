return function (self,pos) 
local tm = _AppService:Get().ToolTipMan
if (tm:DecRefCountAndCheck(self.Entity)) then
	self:RemoveTooltip()
end
end