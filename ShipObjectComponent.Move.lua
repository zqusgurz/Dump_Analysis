return function (self) 
local transform = self.Transform

if not isvalid(transform) then
	log_error("[ShipObjectComponent] Invalid usage")
	return
end

if self.ShipKind ~= 1 then
	log_error("[ShipObjectComponent] Cannot Appear")
	return
end

if not self.Activated then
	return
end

local x_dir = 2 * (_GlobalRand32:RandomInteger() & 1) - 1
local x_len = _GlobalRand32:RandomIntegerRange(20, 50) * 0.01
local x = self.Transform.Position.x
local x_min = self.MinimumPosition.x
local x_max = self.MaximumPosition.x
if x < x_min then
	x_dir = 1
elseif x > x_max then
	x_dir = -1
end

local y_dir = 2 * (_GlobalRand32:RandomInteger() & 1) - 1
local y_len = _GlobalRand32:RandomIntegerRange(20, 50) * 0.01
local y = self.Transform.Position.y
local y_min = self.MinimumPosition.y
local y_max = self.MaximumPosition.y
if y < y_min then
	y_dir = 1
elseif y > y_max then
	y_dir = -1
end

local t = _GlobalRand32:RandomIntegerRange(10, 20) * 0.1

local tween = _TweenLogic:MoveOffset(self.Entity, Vector2(x_dir * x_len, y_dir * y_len), t, EaseType.Linear)
tween.LoopCount = 1
tween.LoopType = TweenLoopType.Restart
tween.AutoDestroy = true
tween:Play()
end