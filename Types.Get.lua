return function (self,t) 
if (not _UtilLogic:IsNilorEmptyString(t["__TypeName"])) then
	return t["__TypeName"]
end
return _UtilLogic:Replace(tostring(t["UnderlyingSystemType"]), "MOD.Core.", "")
end