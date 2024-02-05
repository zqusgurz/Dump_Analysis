return function (self,jobClass,levelUp) 
if (jobClass == 0) then
	return levelUp and 12 or 8
elseif (jobClass == 1) then
	return levelUp and 6 or 4
elseif (jobClass == 2) then
	return levelUp and 24 or 20
elseif (jobClass == 3) then
	return levelUp and 16 or 12
elseif (jobClass == 4) then
	return levelUp and 16 or 12
end
return 0
end