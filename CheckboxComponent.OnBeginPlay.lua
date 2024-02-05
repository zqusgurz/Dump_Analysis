return function (self) 
self.___SoundButtonComponent__.OnBeginPlay(self)
self.Entity:ConnectEvent(ButtonClickEvent, function()
	self:SetState(not self.State)
end)
end