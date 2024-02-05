return function (self,enabled,state) 
if (enabled) then
	self.BeganSpriteChangeFrameSequence = false
	if (not self.SpriteChangeEventConnected) then
		self.SpriteChangeEventConnected = true
		self._T.SpriteChangeFrameEvent = self.Entity:ConnectEvent(SpriteAnimPlayerChangeFrameEvent, function(event)
			self:OnSpriteChangeFrame(event, state)
		end)
	end
else
	if (self.SpriteChangeEventConnected) then
		self.SpriteChangeEventConnected = false
		self.Entity:DisconnectEvent(SpriteAnimPlayerChangeFrameEvent, self._T.SpriteChangeFrameEvent)	
	end
end
end