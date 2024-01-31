return function (self,exp2) 
if (exp2 == false or exp2 == nil or exp2 == "") then
	exp2 = 0
elseif (exp2 == true) then
	exp2 = 1
end
return exp2
end