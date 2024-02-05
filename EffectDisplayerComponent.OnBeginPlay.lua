return function (self) 
if (self.Entity.OwnerId ~= _UserService.LocalPlayer.OwnerId) then
	return
end

self.DamageEffect = _SpawnService:SpawnByModelId("model://transformonly", "DamageEffect", Vector3.zero, nil)
self.DamageEffect:AddComponent(ChildObjectPoolComponent)
self.DamageEffect.ChildObjectPoolComponent.ModelId = "model://fee71bb8-d274-4eb0-8ff1-0b9aaf3abf40"
self.DamageEffect.ChildObjectPoolComponent.AdjustPositionOnPick = true

--log("Begin DamageEffect")
end