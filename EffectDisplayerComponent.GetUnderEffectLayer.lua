return function (self,key) 
if (self._underEffectTable[key] == nil) then
	local sprite = _SpawnService:SpawnByModelId("model://6c13a597-644f-47d9-8310-11ddf6cc74bc", "UnderEffectLayer-"..key, Vector3.zero, self.Entity)
	self._underEffectTable[key] = sprite
	sprite.MapleSpriteRendererComponent.OrderInLayer = 3
	sprite.MapleSpriteRendererComponent.Layer = self.Entity.AvatarRendererComponent.SortingLayer
	sprite.MapleSpriteRendererComponent:GetSpriteEntity().SpriteRendererComponent.SortingLayer = self.Entity.AvatarRendererComponent.SortingLayer
	sprite.MapleSpriteRendererComponent:GetSpriteEntity().SpriteRendererComponent.OrderInLayer = 3
	sprite.MapleSpriteRendererComponent.Loop = false
end
return self._underEffectTable[key]
end