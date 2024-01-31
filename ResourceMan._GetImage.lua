return function (self,imgPath) 
local ds = _DataService:GetTable(_UtilLogic:Replace(imgPath, "/", "."))
if (ds == nil) then
	log_error("No data img:", imgPath)
	return nil
end
return self:ParseData(ds, imgPath)
end