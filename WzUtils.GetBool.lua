return function (self,val,def) 
if (val == nil) then
	return def
end
return tonumber(val) ~= 0
end