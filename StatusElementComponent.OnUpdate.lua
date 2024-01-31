return function (self,delta) 
if (self.Duration < 0 or math.almostequal(self.TargetFill, self.Gauge.FillAmount)) then
	return
end
local g = _TweenLogic:Ease(self.OriginFill, self.TargetFill, 0.7, EaseType.Linear, self.Duration)
self.Gauge.FillAmount = math.min(1, math.max(0, g))
self.Duration = math.min(self.Duration + delta, 0.7)
end