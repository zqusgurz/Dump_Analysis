return function (self,skillId,key) 
if (skillId == nil) then
	return ""
end
local d = _String_Skill.Strings[skillId]
if (d == nil) then
	return ""
end
return d[key] or ""
end