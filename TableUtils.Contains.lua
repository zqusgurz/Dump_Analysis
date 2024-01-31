return function (self,tab,value) 
for _,v in pairs(tab) do
	if (v == value) then
		return true
	end
end
return false
end