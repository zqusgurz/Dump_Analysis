return function (self,templateID) 
local data = self.Caches[templateID]
if (data ~= nil) then
	return data
end

local ds = _DataService:GetTable("Mob")
local row = ds:FindRow("Key", string.format("%07d", templateID))
if (row == nil) then
	log_error(string.format("Mob template is nil : %d", templateID))
	return nil
end

---@type UserDataRow
local dataRow = row
local obj = _HttpService:JSONDecode(dataRow:GetItem("Json"))
data = MobTemplate():Load(obj)

self.Caches[templateID] = data
return data
end