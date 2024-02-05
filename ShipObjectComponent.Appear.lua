return function (self) 
local spriteRenderer = self.SpriteRenderer
local transform = self.Transform

if not isvalid(spriteRenderer) or not isvalid(transform) then
	log_error("[ShipObjectComponent] Invalid usage")
	return
end

if self.ShipKind ~= 1 then
	log_error("[ShipObjectComponent] Cannot Appear")
	return
end

if self.Activated then
	return
end

local originalPosition = self.OriginalPosition
local beginPosition = self.BeginPosition
self.Activated = true

_AppService:Get():ChangeBGM("Bgm04/ArabPirate") -- Sound

local tween
local tweenFunction = function(tweenValue)
    if not isvalid(self) or not self.Activated then
		log_warning("[ShipObjectComponent] Appear aborted")
        tween:Destroy()
		return
    end
	
	-- 내분점
	transform.Position.x = originalPosition.x * tweenValue + beginPosition.x * (1.0 - tweenValue)
	transform.Position.y = originalPosition.y * tweenValue + beginPosition.y * (1.0 - tweenValue)
	transform.Position.z = originalPosition.z * tweenValue + beginPosition.z * (1.0 - tweenValue)
    
	spriteRenderer.Color.a = tweenValue
end
tween = _TweenLogic:MakeTween(spriteRenderer.Color.a, 1.0, self.MoveTime * (1.0 - spriteRenderer.Color.a), EaseType.Linear, tweenFunction)
tween.LoopCount = 1
tween.LoopType = TweenLoopType.Restart
tween.AutoDestroy = true
tween:Play()

if isvalid(self.MoveTimerId) then
	_TimerService:ClearTimer(self.MoveTimerId)
end
local callBack = function()
    self:Move()
end
self.MoveTimerId = _TimerService:SetTimerRepeat(callBack, 6, 2.4)
end