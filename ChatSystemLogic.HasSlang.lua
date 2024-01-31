return function (self,message) 
local find = string.find
local msg = message
for _,curse in ipairs(_Slangs.Slang) do
	if (find(msg, curse[1], 1, true)) then
		return true
	end
end
return false
end