return function (self,skillId) 
local d = (skillId % 10000) // 1000
return d == 0
end