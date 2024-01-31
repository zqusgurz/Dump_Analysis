return function (self,callback) 
local canvas = self.Entity.CanvasGroupComponent
if (self.Tween) then
	---@type Tweener
	local tween = self.Tween
	tween:Destroy()
end
local a = canvas.GroupAlpha
local tw = _TweenLogic:MakeTween(a, 0, 0.3 * a, EaseType.Linear, function(f)
	canvas.GroupAlpha = f
end)
tw.AutoDestroy = true
tw:SetOnEndCallback(function()
	if (callback) then
		callback()
	end
	self.Sprite.SpriteGUIRendererComponent.Enable = false
	self.Sprite.SpriteGUIRendererComponent.RaycastTarget = false
	self.Tween = nil
end)
self.Tween = tw
tw:Play()
end