return function (self,info,index) 
if (info == nil) then
	return 0
end
local infoLen = #info
if (infoLen < 3 * index) then
	return 0
end
return tonumber(string.sub(info, index*3-2, index*3))
end