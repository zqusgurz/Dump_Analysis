return function (self,tooltipOrigin) 
local before = self.TooltipStack[tooltipOrigin] or 0
before += 1
self.TooltipStack[tooltipOrigin] = before
-- log(tooltipOrigin, "++ : ", before)
return before == 1
end