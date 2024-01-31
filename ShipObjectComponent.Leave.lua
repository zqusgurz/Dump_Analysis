return function (self) 
local transform = self.Transform

if not isvalid(transform) then
	log_error("[ShipObjectComponent] Invalid usage")
	return
end

if self.ShipKind ~= 0 then
	log_error("[ShipObjectComponent] Cannot Enter")
	return
end

if not self.Activated then
	-- return
end

local originalPosition = self.OriginalPosition
local beginPosition = self.BeginPosition
self.Activated = false

_SoundService:PlaySound(_UidMan:Get("Sound/Object.img/Whistle"), 1.00) -- Sound

if self.MoveTweener ~= nil then
	---@type Tweener
	local oldTween = self.MoveTweener
	oldTween:Complete()
end
transform.Position.x = originalPosition.x
transform.Position.y = originalPosition.y
local tween = _TweenLogic:MoveTo(self.Entity, Vector2(beginPosition.x, beginPosition.y), self.MoveTime, EaseType.Linear)
tween.LoopCount = 1
tween.LoopType = TweenLoopType.Restart
tween.AutoDestroy = true
tween:Play()
self.MoveTweener = tween
end