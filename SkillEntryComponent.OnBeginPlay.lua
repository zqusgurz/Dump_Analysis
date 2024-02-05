return function (self) 
self.BtSkillUp.Entity:ConnectEvent(ButtonClickEvent, self.TrySkillUp)
self.Background.Entity:ConnectEvent(UITouchDownEvent, self.CheckManualDoubleClicked)
self.Icon.Entity:ConnectEvent(UITouchDownEvent, self._OnHandleUITouchDownEvent)
self:ConnectMouseOverEvent(self.Background.Entity)
end