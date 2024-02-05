return function (self,bulletItemId,skillId,def) 
if (bulletItemId // 10000 == 207 or bulletItemId // 1000 == 5021 or skillId == 4111004) then
	return 0.12
elseif skillId == 3111006 or skillId == 3211006 or skillId == 13111001 or skillId == 33001000 or skillId == 33111001 then
	return 0.06
elseif skillId == 5221007 then
	return 0.12
elseif skillId == 5001003 or skillId == 5210000 then
	return 0.24
else
	return def
end
end