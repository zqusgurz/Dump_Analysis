return function (self,scrollBar,scrollViewEntity) 
scrollViewEntity:ConnectEvent(ScrollPositionChangedEvent, function(event)
	local c = scrollBar._barHandle.ControlScrollBarHandleComponent
	c:UpdateScrollBarPosition(event.NormalizedPosition)
end)
scrollViewEntity:ConnectEvent(UpdateScrollBarEvent, function(event)
	scrollBar:OnChangeScrollElement(event)
end)
self.ConnectedScrollbar[scrollViewEntity] = scrollBar
end