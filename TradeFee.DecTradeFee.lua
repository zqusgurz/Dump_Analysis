return function (self,originMoney) 
if (originMoney >= 100000000) then
	return originMoney - (originMoney * 6 // 100)
elseif (originMoney >= 25000000) then
	return originMoney - (originMoney * 5 // 100)
elseif (originMoney >= 10000000) then
	return originMoney - (originMoney * 4 // 100)
elseif (originMoney >= 5000000) then
	return originMoney - (originMoney * 3 // 100)
elseif (originMoney >= 1000000) then
	return originMoney - (originMoney * 18 // 1000)
elseif (originMoney >= 100000) then
	return originMoney - (originMoney * 8 // 1000)
end
return originMoney
end