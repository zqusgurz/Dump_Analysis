return function (self,uol,localPos,left,pool,destroyCallback,loop) 
self.UOL = uol
self.Pool = pool
self.Repeat = loop
self.Entity.TransformComponent.Position = localPos
self.Entity.SpriteRendererComponent.SpriteRUID = _UidMan:GetAnimation(uol)
self.Entity.SpriteRendererComponent.FlipX = not left
self.Entity.SpriteRendererComponent.Color = Color.white
self.Entity.Enable = true
self.DestroyCallback = destroyCallback
end