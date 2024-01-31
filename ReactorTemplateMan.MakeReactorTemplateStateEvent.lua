return function (self,obj) 
local ret = {}
ret.Type = _WzUtils:GetInt32(obj.type, 0)
ret.State = _WzUtils:GetInt32(obj.state, 0)
ret.Lt = _WzUtils:GetVector(obj.lt)
ret.Rb = _WzUtils:GetVector(obj.rb)
for _,v in _WzUtils:GetLabeled(obj) do
	table.insert(ret.Data, tonumber(v))
end
return ret
end