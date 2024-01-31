return function (self) 
self.__TooltipBaseComponent__.OnBeginPlay(self)
self.Equip = _SpawnService:SpawnByModelId("model://215fcf60-b4ed-4e1a-9594-c0ec66ed1f7e", "Equip", Vector3.zero, self.Entity).TooltipEquipComponent
self.Equip.Entity.UITransformComponent.Pivot = Vector2(0, 1)
self.Equip.Entity.UITransformComponent.AlignmentOption = AlignmentType.TopLeft
self.Equip.Entity.UITransformComponent.anchoredPosition = Vector2.zero
self.Equipping = _SpawnService:SpawnByModelId("model://215fcf60-b4ed-4e1a-9594-c0ec66ed1f7e", "Equipping", Vector3.zero, self.Entity).TooltipEquipComponent
self.Item = _SpawnService:SpawnByModelId("model://ab401197-f77c-469a-869c-07290704166b", "Equipping", Vector3.zero, self.Entity).TooltipItemComponent
end