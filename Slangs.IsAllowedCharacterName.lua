return function (self,name,adminLevel) 
local regex = Regex("^[0-9a-zA-Z가-힣]*$")
if (not regex:IsMatch(name)) then
	return false
end
if (adminLevel == 0) then
	local lowered = name:lower()
	local find = string.find
	local fn = _Slangs.ForbiddenName
	for _,curse in ipairs(_Slangs.Slang) do
		if (find(lowered, curse[1]:lower(), 1, true)) then
			return false
		end
	end
	for i=1,#fn do
		local forbiddenName = fn[i]
		if (find(lowered, forbiddenName:lower(), 1, true)) then
			return false
		end
	end
end
return true
end