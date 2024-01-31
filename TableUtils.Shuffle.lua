return function (self,tab) 
for i=#tab,1,-1 do
	local j = _UtilLogic:RandomIntegerRange(1, i)
	local tmp = tab[i]
	tab[i] = tab[j]
	tab[j] = tmp
end
end