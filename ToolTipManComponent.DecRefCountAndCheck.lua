return function (self,tooltipOrigin) 
local before = self.TooltipStack[tooltipOrigin] or 0
--before -= 1
before = 0
self.TooltipStack[tooltipOrigin] = before
-- log(tooltipOrigin, "-- : ", before)
-- return before == 0
return true
end