return function (self,callback) 
local canvas = self.Entity.CanvasGroupComponent
if (self.Tween) then
	---@type Tweener
	local tween = self.Tween
	tween:Destroy()
end
local a = canvas.GroupAlpha
local tw = _TweenLogic:MakeTween(a, 1, 0.3 * (1 - a), EaseType.Linear, function(f)
	canvas.GroupAlpha = f
end)
self.Sprite.SpriteGUIRendererComponent.Enable = true
self.Sprite.SpriteGUIRendererComponent.RaycastTarget = true
tw.AutoDestroy = true
tw:SetOnEndCallback(function()
	if (callback) then
		callback()
	end
	self.Tween = nil
end)
self.Tween = tw
tw:Play()
end