return function (self,y,x) 
if (x > 0) then
	return math.atan(y / x)
elseif (y >= 0 and x < 0) then
	return math.atan(y / x) + math.pi
elseif (y < 0 and x < 0) then
	return math.atan(y / x) - math.pi
elseif (y > 0 and x == 0) then
	return math.pi / 2
elseif (y < 0 and x == 0) then
	return -math.pi / 2
else
	return 0
end
end