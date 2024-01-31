return function (self,range,hit,left) 
local gap = self.EndPoint - self.StartPoint

if (left) then
	gap.x = -math.abs(gap.x)
else
	gap.x = math.abs(gap.x)
end

local dir = gap:Normalize()

local t = self.Entity.TransformComponent
local removeAfter = range * 60 / self.BulletSpeed

-- 각도 제한
local angle = math.atan(dir.y, dir.x)
local abs_angle = math.abs(angle)
local s = angle > 0 and 1 or -1

-- rad(30) <= abs(angle) <= pi-rad(30)
if (0.5236 <= abs_angle and abs_angle <= 2.6178) then
	dir.x = 0.866 * (left and -1 or 1) -- +-cos(rad(30))
	dir.y = 0.5 * s                    --   sin(+-rad(30))
end

local deg = _NumberUtils:Vector2ToDegree(dir)
if (deg <= 90 and deg >= -90) then
    t.WorldZRotation = deg
    self.Entity.SpriteRendererComponent.FlipX = false
else
    t.WorldZRotation = deg - 180
    self.Entity.SpriteRendererComponent.FlipX = true
end

local ballDestPoint = self.StartPoint + (dir * range)
local moveTween = _TweenLogic:MoveTo(self.Entity, ballDestPoint, removeAfter, EaseType.Linear)
moveTween.AutoDestroy = true
self.MoveTween = moveTween
self.Hit = function()
	if (not self._T["K"]) then
		hit(t.WorldPosition:ToVector2(), Vector2(0.02, 0.02))
		self._T["K"] = true
	end
end

self.Timer = _TimerService:SetTimerOnce(function()
	self._T["K"] = true
	self.Timer = 0
	local c = self.Entity.SpriteRendererComponent.Color
	local tween = _TweenLogic:MakeTween(1, 0, 0.2, EaseType.Linear, function(f)
		c.a = f
	end)
	tween.AutoDestroy = true
	tween:SetOnEndCallback(function()
		self:Release()
	end)
	self.Tween = tween
	tween:Play()
end, removeAfter)
end