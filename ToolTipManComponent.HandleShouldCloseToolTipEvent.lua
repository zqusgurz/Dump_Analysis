return function (self,event) 
local type = event.ToolTipType
if (type == _CloseToolTipType.Equip) then
	self:ClearTooltip(_TooltipType.Equip)
	self:ClearTooltip(_TooltipType.CashEquip)
	self:ClearTooltip(_TooltipType.Bundle)
elseif (type == _CloseToolTipType.Inven) then
	self:ClearTooltip(_TooltipType.Equip)
	self:ClearTooltip(_TooltipType.CashEquip)
	self:ClearTooltip(_TooltipType.Bundle)
elseif (type == _CloseToolTipType.KeySet) then
	self:ClearTooltip(_TooltipType.Skill)
	self:ClearTooltip(_TooltipType.Bundle)
elseif (type == _CloseToolTipType.Mini) then
	self:ClearTooltip(_TooltipType.Mini)
elseif (type == _CloseToolTipType.Function) then
	self:ClearTooltip(_TooltipType.Function)
elseif (type == _CloseToolTipType.NpcShop) then
	self:ClearTooltip(_TooltipType.Shop)
elseif (type == _CloseToolTipType.Quest) then
	self:ClearTooltip(_TooltipType.Mini)
elseif (type == _CloseToolTipType.Skill) then
	self:ClearTooltip(_TooltipType.Skill)
elseif (type == _CloseToolTipType.TradingRoom) then
	self:ClearTooltip(_TooltipType.Equip)
	self:ClearTooltip(_TooltipType.CashEquip)
	self:ClearTooltip(_TooltipType.Bundle)
end
end