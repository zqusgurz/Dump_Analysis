return function (self,job) 
if (job == 0) then
	return 0
end
if (job % 10 == 2) then
	return 4
elseif (job % 10 == 1) then
	return 3
elseif (job % 100 ~= 0 and job % 10 == 0) then
	return 2
else
	return 1
end
end