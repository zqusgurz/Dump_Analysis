return function (self) 
local toolTipMan = _AppService:Get().ToolTipMan
toolTipMan:TryReleaseToolTip(_TooltipType.Skill, self.Entity)
end