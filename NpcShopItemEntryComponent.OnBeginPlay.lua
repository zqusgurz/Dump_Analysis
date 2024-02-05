return function (self) 
self.MouseRect:ConnectEvent(UITouchDownEvent, self._OnHandleUITouchDownEvent)
self:ConnectMouseOverEvent(self.MouseRect)
self.RechargeButton:ConnectEvent(ButtonClickEvent, self.OnRechargeButton)
self.SelectionBackground.Enable = false
end