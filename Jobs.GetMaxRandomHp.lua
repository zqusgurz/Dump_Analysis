return function (self,jobClass,levelUp) 
if (jobClass == 0) then
	return levelUp and 16 or 12
elseif (jobClass == 1) then
	return levelUp and 28 or 24
elseif (jobClass == 2) then
	return levelUp and 14 or 10
elseif (jobClass == 3) then
	return levelUp and 24 or 20
elseif (jobClass == 4) then
	return levelUp and 24 or 20
end
return 0
end