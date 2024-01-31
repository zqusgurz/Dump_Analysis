return function (self,pos,lb,rt,offset) 
local real_lb = lb:Clone()
local real_rt = rt:Clone()
real_lb.x -= offset
real_lb.y -= offset
real_rt.x += offset
real_rt.y += offset
if (pos.x < real_lb.x) then
	return false
end
if (pos.x > real_rt.x) then
	return false
end
if (pos.y > real_rt.y) then
	return false
end
if (pos.y < real_lb.y) then
	return false
end
return true
end