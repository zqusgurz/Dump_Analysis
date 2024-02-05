return function (self) 
self:ClearAnimationTimer()
self:ClearVanishTimer()
self:DisableTweenFloating()
self.SpriteEntity.SpriteRendererComponent.SpriteRUID = ""
_ObjectPool:Release(self.ReturnPool, self.Entity)
end