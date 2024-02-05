return function (self) 
local spriteRenderer = self.SpriteRenderer

if not isvalid(spriteRenderer) then
	log_error("[ShipObjectComponent] Invalid usage")
	return
end

if self.ShipKind ~= 1 then
	log_error("[ShipObjectComponent] Cannot Disappear")
	return
end

if not self.Activated then
	return
end

self.Activated = false
if isvalid(self.MoveTimerId) then
	_TimerService:ClearTimer(self.MoveTimerId)
	self.MoveTimerId = nil
end

local tween
local tweenFunction = function(tweenValue)
    if not isvalid(self) or self.Activated then
		log_warning("[ShipObjectComponent] Disappear aborted")
        tween:Destroy()
		return
    end
	
    spriteRenderer.Color.a = tweenValue
end
tween = _TweenLogic:MakeTween(spriteRenderer.Color.a, 0.0, self.MoveTime * (spriteRenderer.Color.a - 0.0), EaseType.Linear, tweenFunction)
tween.LoopCount = 1
tween.LoopType = TweenLoopType.Restart
tween.AutoDestroy = true
tween:Play()
end