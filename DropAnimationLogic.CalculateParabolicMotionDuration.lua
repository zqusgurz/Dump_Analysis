return function (self,y1,y2,explosive) 
local x = 100
local u = 1
local t = 1
if (explosive) then
    x = 180
    u = 1.8
    t = 1.8
end
if (y1 >= y2) then
    return u
end
local g = y1 - y2
local s = math.sqrt(2 * (x + g * 100) / 0.8)
local k = 0.03 * (s + 1) + t * 0.5
if (u >= k) then
    return k
end
return u
end