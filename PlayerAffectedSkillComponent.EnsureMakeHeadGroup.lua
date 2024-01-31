return function (self) 
if (not isvalid(self.HeadGroup)) then
	self.HeadGroup = _SpawnService:SpawnByModelId("model://transformonly", "HeadGroup", Vector3(-10000, -10000, 0), self.Entity)
	self.BodyGroup = _SpawnService:SpawnByModelId("model://transformonly", "BodyGroup", Vector3(-10000, -10000, 0), self.Entity)
	self.CenterGroup = _SpawnService:SpawnByModelId("model://transformonly", "CenterGroup", Vector3(-10000, -10000, 0), self.Entity)
	self:UpdateHeadBoxPosition(self.Entity.StateComponent.CurrentStateName)
end
end