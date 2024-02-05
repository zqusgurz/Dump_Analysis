return function (self) 
self:OnChangeTab(self.CurrentTab)
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Quest))
end