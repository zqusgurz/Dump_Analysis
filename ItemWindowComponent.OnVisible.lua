return function (self) 
self.__ControlWindowComponent__.OnVisible(self)
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Inven))
self:InvalidateItems()
self:UpdateMoney()
end