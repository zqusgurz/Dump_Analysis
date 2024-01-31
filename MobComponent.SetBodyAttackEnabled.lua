return function (self,b) 
if (b) then
	if (not isvalid(self.BodyAttack)) then
		local bodyAttack = _SpawnService:SpawnByModelId("model://eea053f4-4b54-4ada-aa0c-69f5f61c4330", "BodyAttack", Vector3.zero, self.Entity)
		bodyAttack.TransformComponent.Position = Vector3.zero
		self.BodyAttack = bodyAttack
	end
	self.BodyAttack.Enable = true
else
	if (isvalid(self.BodyAttack)) then
		self.BodyAttack.Enable = false
	end
end
end