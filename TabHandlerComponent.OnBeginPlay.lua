return function (self) 
self.Entity:ConnectEvent(ChangeTabEvent, function(event)
	self:InvokeTabFunction(event.TabIndex)
end)
end