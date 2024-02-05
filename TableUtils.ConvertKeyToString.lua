return function (self,t) 
local ret = {}
for k,v in pairs(t) do
	ret[tostring(k)] = v
end
return ret
end