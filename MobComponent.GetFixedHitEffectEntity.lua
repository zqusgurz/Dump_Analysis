return function (self) 
if (self.CachedHitEffect_Fixed ~= nil) then
	return self.CachedHitEffect_Fixed
end
local entity = _SpawnService:SpawnByModelId("model://6c13a597-644f-47d9-8310-11ddf6cc74bc", "HitEffect_Fixed", Vector3.zero, self.Entity.CurrentMap)
self.CachedHitEffect_Fixed = entity
entity.MapleSpriteRendererComponent.Loop = false
entity.MapleSpriteRendererComponent.DefaultAnimationDelay = 120
entity.MapleSpriteRendererComponent.DisappearWhenAnimationOnceEnd = true
return entity
end