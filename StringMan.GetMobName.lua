return function (self,mobId) 
if (mobId == nil) then
	return ""
end
local n = _String_Mob.Strings[mobId]
if (n ~= nil) then
	return n["name"] or "Unknown"
end
return "알 수 없음"
end