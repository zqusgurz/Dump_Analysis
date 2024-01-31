return function (self) 
if (self.Product == nil) then
	return
end
_AppService:Get().ToolTipMan:TryReleaseToolTip(_TooltipType.Shop, self.Entity)
end