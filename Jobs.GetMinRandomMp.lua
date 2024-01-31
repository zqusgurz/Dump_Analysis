return function (self,jobClass,levelUp) 
if (jobClass == 0) then
	return levelUp and 10 or 6
elseif (jobClass == 1) then
	return levelUp and 4 or 2
elseif (jobClass == 2) then
	return levelUp and 22 or 18
elseif (jobClass == 3) then
	return levelUp and 14 or 10
elseif (jobClass == 4) then
	return levelUp and 14 or 10
end
return 0
end