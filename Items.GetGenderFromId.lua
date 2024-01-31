return function (self,itemId) 
if (itemId // 1000000 ~= 1) then
	return 2
end
local d = itemId // 1000 % 10
if (d <= 1) then
	return d
end
return 2
end