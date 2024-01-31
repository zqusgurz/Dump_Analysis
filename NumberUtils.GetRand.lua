return function (self,rand,f0,f1) 
if (f0 > f1) then
	local tmp = f0
	f0 = f1
	f1 = tmp
end
return f0 + (f1 - f0) * ((rand % 10000000) / 9999999)
end