return function (self,id) 
if (self.Say[id] ~= nil) then
	return
end
local dsSay = _DataService:GetTable("Quest.Say")
local sayRow = dsSay:FindRow("Key", tostring(id))
if (sayRow ~= nil) then 
	self.Say[id] = _HttpService:JSONDecode(sayRow:GetItem("Json")) 
else
	self.Say[id] = {}
end
end