return function (self,itemId) 
local c = itemId // 1000000
if (c == 1) then
	return true
end
if (c == 0) then
	local c2 = itemId // 10000
	return c2 == 2 or c2 == 3
end
return false
end