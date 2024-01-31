return function (self) 
if (self.HeadGroup == nil) then
	self.HeadGroup = _SpawnService:SpawnByModelId("model://transformonly", "HeadGroup", Vector3(-10000, -10000, 0), self.Entity)
	self:UpdateHeadBoxPosition(self.Entity.StateComponent.CurrentStateName)
end
end