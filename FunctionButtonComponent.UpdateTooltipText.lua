return function (self,text) 
self.TooltipText = text
local tMan = _AppService:Get().ToolTipMan
if (tMan:IsActiveTooltipFrom(_TooltipType.Mini, self.Entity)) then
	self:RemoveTooltip()
	self:MakeTooltip()
end
end