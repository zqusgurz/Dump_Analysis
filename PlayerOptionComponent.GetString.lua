return function (self,key,def) 
local val = self.Data[key]
if (_UtilLogic:IsNilorEmptyString(val)) then
	return def
end
return val
end