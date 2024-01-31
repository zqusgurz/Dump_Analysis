return function (self,id,desc) 
local dt = _DataService:GetTable("PreloadMob")
local row = dt:FindRow("id", string.format("%07d", id))
if (row ~= nil) then
	local ruids = _HttpService:JSONDecode(row:GetItem("desc"))
	table.insert(self.RegisterPreloads, {ruids, desc})
end
end