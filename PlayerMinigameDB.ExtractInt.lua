return function (self,combinedInfo) 
local tab = {}
if combinedInfo < 10 ^ 11 then 
	tab[1] = math.floor(combinedInfo / 2^24)
	tab[2] = math.floor((combinedInfo % 2^24) / 2^16)
	tab[3] = math.floor((combinedInfo % 2^16) / 2^8)
	tab[4] = combinedInfo % 2^8
else
	tab[1] = math.floor(combinedInfo / 2^36)
	tab[2] = math.floor((combinedInfo % 2^36) / 2^24)
	tab[3] = math.floor((combinedInfo % 2^24) / 2^12)
	tab[4] = combinedInfo % 2^12
end
return tab
end