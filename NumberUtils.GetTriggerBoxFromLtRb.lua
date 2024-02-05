return function (self,lt,rb,left) 
local size = Vector2(rb.x - lt.x, rb.y - lt.y)
local center = Vector2.zero
local abs = math.abs
if (abs(lt.x) > abs(rb.x)) then
	center.x = -abs(lt.x) + (size.x / 2)
else
	center.x = abs(rb.x) - (size.x / 2)
end
if (abs(lt.y) > abs(rb.y)) then
	center.y = abs(lt.y) - (size.y / 2)
else
	center.y = -abs(rb.y) + (size.y / 2)
end
if (not left) then
	center.x = -center.x
end
return center / 100, size / 100
end