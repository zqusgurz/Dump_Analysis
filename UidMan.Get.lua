return function (self,path) 
local ret = self.Cache[path]
if (ret) then
	return ret
end
local ds = _DataService:GetTable("RUID")
local found = ds:FindRow("Key", path)
if (found) then
	local item = found:GetItem("RUID")
	self.Cache[path] = item
	-- log(string.format("Loaded uid path %s -> %s", path, item))
	return item
else
	log_error(string.format("Not found uid path %s", path))
	self.Cache[path] = ""
	return ""
end
end