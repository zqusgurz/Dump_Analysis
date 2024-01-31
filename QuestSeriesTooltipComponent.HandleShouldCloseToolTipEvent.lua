return function (self,event) 
if (event.ToolTipType == _CloseToolTipType.Quest) then
	self:RemoveTooltip()
end
end