return function (self,key) 
if (self._overEffectTable[key] == nil) then
	local sprite = _SpawnService:SpawnByModelId("model://6c13a597-644f-47d9-8310-11ddf6cc74bc", "OverEffectLayer-"..key, Vector3.zero, self.Entity)
	self._overEffectTable[key] = sprite
	local m = sprite.MapleSpriteRendererComponent
	local s = m:GetSpriteEntity().SpriteRendererComponent
	m.OrderInLayer = 5
	m.Layer = "Effect"
	s.SortingLayer = "Effect"
	s.OrderInLayer = 5
	m.Loop = false
end
return self._overEffectTable[key]
end