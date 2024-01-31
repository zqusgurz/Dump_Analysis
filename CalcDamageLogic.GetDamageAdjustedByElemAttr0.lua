return function (self,damage,attr,adjust) 
if (attr == 0) then
	return damage
elseif (attr == 1) then
	return 0
elseif (attr == 2) then
	return (1 - adjust * 0.5) * damage
elseif (attr == 3) then
	return (1 + adjust * 0.5) * damage
end
return damage
end