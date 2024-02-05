return function (self,msg,messageType) 
local txt = self.Text
local txtEntity = txt.Entity
local entity = self.Entity
local canvas = entity.CanvasGroupComponent

txt.Entity.Enable = true
if (messageType == _ScreenMsgType.Regular) then -- 하얀색
	txt.FontColor = Color.white
elseif (messageType == _ScreenMsgType.Bonus) then -- 노란색
	txt.FontColor = Color(1,1,0.125)
elseif (messageType == _ScreenMsgType.Child) then -- 하늘색
	txt.FontColor = Color(0.91015625,0.765625,1)
end
_EntityUtils:SetPositionUIEntitySafelyEx(entity, 0, 0)
txt.Text = msg
canvas.GroupAlpha = 1
local tweener = _TweenLogic:MakeTween(1, 0, 6, EaseType.Linear, function(f) 
	canvas.GroupAlpha = f
end)
tweener.AutoDestroy = true
tweener.Delay = 3
tweener:SetOnEndCallback(function()
	txtEntity.Enable = false
end)
tweener:Play()
self._T.Tweener = tweener
end