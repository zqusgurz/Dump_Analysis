return function (self,table,predicate) 
for k,v in pairs(table) do
	if (predicate(k,v)) then
		return true
	end
end
return false
end