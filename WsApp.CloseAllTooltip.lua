return function (self) 
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Equip))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Inven))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.KeySet))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Skill))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Mini))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Quest))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.NpcShop))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.TradingRoom))
end