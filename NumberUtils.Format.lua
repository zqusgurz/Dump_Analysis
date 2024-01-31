return function (self,amount) 
-- http://lua-users.org/wiki/FormattingNumbers
local formatted = tostring(amount)
while true do
	local k
	formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
	if (k==0) then
		break
	end
end
return formatted
end