return function (self,s,e,i) 
local ret = {}
local index = 1
for k=s,e,i do
	ret[index] = k
	index += 1
end
return ret
end