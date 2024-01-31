return function (self) 
if (not self.Entity.EnabledInHierarchy) then
	return
end
local canvas = self.Entity.CanvasGroupComponent
local tw = _TweenLogic:MakeTween(1, 0, 0.2, EaseType.Linear, function(a)
	canvas.GroupAlpha = a
end)
tw.AutoDestroy = true
tw:SetOnEndCallback(function()
	self.Entity.Enable = false
end)
tw:Play()
end