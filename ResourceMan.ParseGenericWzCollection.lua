return function (self,collectionName,key) 
local ds = _DataService:GetTable(collectionName)
local r = ds:FindRow("Key", key)
return _HttpService:JSONDecode(r:GetItem("Json"))
end