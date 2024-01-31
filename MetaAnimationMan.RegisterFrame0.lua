return function (self,entity,a0,a1,z0,z1,delay,afterCallback) 
---@type Tweener
local tweener = self.Tweeners[entity]
if (tweener) then
	tweener:Destroy()
end
local spriteRenderer = entity.SpriteRendererComponent
local color = spriteRenderer.Color
if (a0 ~= -1) then
	a0 = a0 / 255
	color.a = a0
else
	a0 = color.a
end
if (a1 ~= -1) then
	tweener = _TweenLogic:MakeTween(a0, a1 / 255, delay, EaseType.Linear, function(v)
		color.a = v
	end)
	tweener:SetOnEndCallback(function()
		self.Tweeners[entity] = nil
		if (afterCallback) then
			afterCallback()
		end
	end)
	self.Tweeners[entity] = tweener
	tweener:Play()
	--log(string.format("Tween~ %.3f ~ %.3f  delay: %.2f", a0, a1 / 255, frame.Delay))
end
end