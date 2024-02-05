return function (self) 
local toolTipMan = _AppService:Get().ToolTipMan
if (self.Id > 0) then
	toolTipMan:TryReleaseToolTip(_TooltipType.Skill, self.Entity)
elseif (self.Id < 0) then
	toolTipMan:TryReleaseToolTip(_TooltipType.Bundle, self.Entity)
end
end