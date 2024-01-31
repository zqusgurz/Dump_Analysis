return function (self,x) 
x = x & 0xFFFFFFFF
if (x & 0x80000000) ~= 0 then
	x = -((~x + 1) & 0xFFFFFFFF)
end
return x
end