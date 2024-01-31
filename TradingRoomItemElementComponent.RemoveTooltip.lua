return function (self) 
local toolTipMan = _AppService:Get().ToolTipMan
---@type ItemSlotBase
local item = self.Item
if (not item) then
	return
end
if (_Items:IsEquip(item.ItemId)) then
	toolTipMan:TryReleaseToolTip(_TooltipType.Equip, self.Entity)
else
    toolTipMan:TryReleaseToolTip(_TooltipType.Bundle, self.Entity)
end
end