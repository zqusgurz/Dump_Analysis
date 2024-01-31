return function (self,path) 
local regex = Regex("(.*?\\.img)\\/?(.*)")
local match = regex:Match(path)
if not match.Success then
	log_error("Cannot load object: " .. path)
	return nil
end

---@type table<any, RegexGroup>
local groups = match:GetGroups()
local imgPath = groups[2]:GetCaptures()[1].Text
local subPath = groups[3]:GetCaptures()[1].Text
return imgPath, subPath
end