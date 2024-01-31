return function (self,errorMsgRUID) 
self.Entity.Enable = true
local canvas = self.Entity.CanvasGroupComponent
local tw = _TweenLogic:MakeTween(0, 1, 0.2, EaseType.Linear, function(a)
	canvas.GroupAlpha = a
end)
tw.AutoDestroy = true
tw:Play()
self.ErrorMessage.SpriteGUIRendererComponent.ImageRUID = errorMsgRUID
end