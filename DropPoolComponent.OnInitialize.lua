return function (self) 
if not (isvalid(self._dropsGroup)) then
	local pool = _SpawnService:SpawnByModelId("model://transformonly", "Drops", Vector3.zero, self.Entity)
	self._dropsGroup = pool
end
end