return function (self,templateID) 
local data = self.Caches[templateID]
if (data ~= nil) then
	return data
end

local ds = _DataService:GetTable("Npc")
local row = ds:FindRow("Key", string.format("%07d", templateID))
if (row == nil) then
	return nil
end

local parsedJson = _HttpService:JSONDecode(row:GetItem("Json"))
data = NpcTemplate():Load(templateID, parsedJson)
self.Caches[templateID] = data
return data
end