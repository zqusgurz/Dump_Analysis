return function (self) 
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.KeySet))
self:LoadCurrentKeySetting()
self:InvalidatePosition()
self.Changed = false
end