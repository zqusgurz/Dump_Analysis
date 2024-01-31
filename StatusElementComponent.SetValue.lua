return function (self,value,max,type) 
local before = self:_SetNumber(value, max, type)
self:_SetGauge(value, max, type, value < before)
end