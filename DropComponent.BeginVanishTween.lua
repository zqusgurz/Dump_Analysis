return function (self) 
local color = self.SpriteEntity.SpriteRendererComponent.Color
local tw = _TweenLogic:MakeTween(1, 0, 1.5, EaseType.Linear, function(f)
	color.a = f
end)
tw.AutoDestroy = true
tw:SetOnEndCallback(self.OnDestroyDrop)
self.VanishTween = tw
tw:Play()
end