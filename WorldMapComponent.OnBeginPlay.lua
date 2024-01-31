return function (self) 
self.Base:ConnectEvent(UITouchDownEvent, function(event)
	self:_OnHandleUITouchDownEvent(event)	
end)
end