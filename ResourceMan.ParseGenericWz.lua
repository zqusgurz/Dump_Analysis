return function (self,path,cacheImg) 
local cache = self._GenericCaches[path]
if (cache ~= nil) then
	return cache
end
local function p() return self:ParseResourcePath(path) end
local imgPath, subPath = p()
local ds = _DataService:GetTable(_UtilLogic:Replace(imgPath, "/", "."))
if (ds == nil) then
	log_error("No data img:", imgPath)
	return nil
end
if (subPath ~= nil and subPath ~= "") then
	local obj = nil
	local start = 1
	while true do
		local ps,_ = subPath:find("/",start,true)
		local sub = ps == nil and subPath:sub(start) or subPath:sub(start,ps-1)
		if (obj == nil) then
			local r = ds:FindRow("Key", sub)
			if (r == nil) then
				log_error(string.format("cannot parse generic wz path [%s] no sub path '%s'", path, sub))
				return nil
			end
			obj = _HttpService:JSONDecode(r:GetItem("Json"))
		else
			obj = obj[sub]
		end
		if (ps == nil) then break end
		start=ps+1
	end
	if (cacheImg) then
		self._GenericCaches[path] = obj
	end
	return obj
else
	log_error("Failed to parse '" .. path .. "'. must have sub path.")
	return nil
end
end