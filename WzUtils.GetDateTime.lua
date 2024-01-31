return function (self,val) 
if (val == nil or val == "") then
	return nil
end
return DateTime(val, "yyyyMMddHH") - TimeSpan.FromHours(9)
end