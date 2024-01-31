return function (self) 
local toolTipMan = _AppService:Get().ToolTipMan
if (self.LinkedItemTI == 1) then
	toolTipMan:TryReleaseToolTip(_TooltipType.CashEquip, self.Entity)
	toolTipMan:TryReleaseToolTip(_TooltipType.Equip, self.Entity)
else
	toolTipMan:TryReleaseToolTip(_TooltipType.Bundle, self.Entity)
end
end