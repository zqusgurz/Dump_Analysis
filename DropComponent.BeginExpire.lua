return function (self) 
self:ClearAnimationTimer()
self:DisableTweenFloating()
self.Entity.TransformComponent.WorldPosition = self.Position:Clone()
self.SpriteEntity.TransformComponent.ZRotation = 0
local color = self.SpriteEntity.SpriteRendererComponent.Color
local tween = _TweenLogic:MakeTween(1, 0, 1, EaseType.Linear, function(f) 
	color.a = f
end)
tween.AutoDestroy = true
tween:SetOnEndCallback(self.OnDestroyDrop)
tween:Play()
end