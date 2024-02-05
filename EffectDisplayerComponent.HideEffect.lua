return function (self,over,key) 
---@type Entity
local sprite = (over and self._overEffectTable[key] or self._underEffectTable[key])
if (isvalid(sprite)) then
	sprite.MapleSpriteRendererComponent:GetSpriteEntity().SpriteRendererComponent.Color.a = 0
end
end