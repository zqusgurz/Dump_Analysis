return function (self,digitObjects,pos) 
local tw1 = _TweenLogic:MoveOffset(self.Entity, Vector2(0, 0.3), 3, EaseType.Linear)
--_TweenLogic:MakeTween(0, 0.3, 3, EaseType.Linear, function(f)
--    self.Entity.TransformComponent.WorldPosition.y = pos.y + f
--end)
local tw2 = _TweenLogic:MakeTween(1, 0, 1, EaseType.Linear, function(f)
	for _,digit in ipairs(digitObjects) do
		digit.SpriteRendererComponent.Color.a = f
	end
end)
tw2.Delay = 0.3
tw2.AutoDestroy = true
tw2:SetOnEndCallback(function()
    tw1:Stop()
    tw1:Destroy()
    self.Entity.ChildObjectPoolComponent:Clear(false)
    self.Entity.Parent.ChildObjectPoolComponent:Release(self.Entity)		
end)
tw2:Play()
end