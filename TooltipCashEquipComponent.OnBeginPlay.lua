return function (self) 
self.__TooltipBaseComponent__.OnBeginPlay(self)
self.Cash = _SpawnService:SpawnByModelId("model://215fcf60-b4ed-4e1a-9594-c0ec66ed1f7e", "Cash", Vector3.zero, self.Entity)
self.Normal = _SpawnService:SpawnByModelId("model://215fcf60-b4ed-4e1a-9594-c0ec66ed1f7e", "Normal", Vector3.zero, self.Entity)
end