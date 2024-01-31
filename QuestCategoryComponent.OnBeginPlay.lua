return function (self) 
self.Bar:ConnectEvent(UITouchDownEvent, self._OnHandleUITouchDownEvent)
end