return function (self,n0,n1) 
if (n0 > n1) then
	local tmp = n1
	n1 = n0
	n0 = tmp
end
local r = self:Random()
return r % (n1 - n0 + 1) + n0
end