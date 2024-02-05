return function (self,pos) 
if (self.Path) then
	self.Path.SpriteGUIRendererComponent.Color.a = 0
end

local tm = _AppService:Get().ToolTipMan
tm:TryReleaseToolTip(_TooltipType.Mini, self.Entity)
tm:TryReleaseToolTip(_TooltipType.Function, self.Entity)
end