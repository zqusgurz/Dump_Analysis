return function (self,sender,stateEvent) 
if stateEvent.CurrentStateName == "ATTACK_WAIT" then
	self.Entity.SpriteRendererComponent.SpriteRUID = self.ActionSheet["ATTACK"]
else
	self.Entity.SpriteRendererComponent.SpriteRUID = self.ActionSheet[stateEvent.CurrentStateName]
end

--self.__StateAnimationComponent__.ReceiveStateChangeEvent(self, sender,stateEvent)
end