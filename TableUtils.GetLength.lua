return function (self,tab) 
local i = 0
for _,_ in pairs(tab) do
	i += 1
end
return i
end