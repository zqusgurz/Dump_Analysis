return function (self,beg,aft) 
local g = (aft - beg) / 1000
local ret = {}
local d = g // 86400
if (d > 0) then
	ret[#ret + 1] = string.format("%d일", d)
end
local h = (g % 86400) // 3600
if (h > 0) then
	ret[#ret + 1] = string.format("%d시간", h)
end
local m = (g % 3600) // 60
if (m > 0) then
	ret[#ret + 1] = string.format("%d분", m)
end
local s = math.floor(g % 60)
if (s > 0) then
	ret[#ret + 1] = string.format("%d초", s)
end
return table.concat(ret, " ")
end