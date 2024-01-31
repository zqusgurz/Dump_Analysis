return function (self) 
if (self.CachedHitEffect ~= nil) then
	return self.CachedHitEffect
end
local entity = _SpawnService:SpawnByModelId("model://6c13a597-644f-47d9-8310-11ddf6cc74bc", "HitEffect", Vector3.zero, self.Entity)
self.CachedHitEffect = entity
entity.MapleSpriteRendererComponent.Loop = false
entity.MapleSpriteRendererComponent.DefaultAnimationDelay = 120
entity.MapleSpriteRendererComponent.DisappearWhenAnimationOnceEnd = true
return entity
end