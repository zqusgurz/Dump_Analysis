return function (self) 
local r = self:Random()
return ((r % 10000000) / 9999999)
end