return function (self,name) 
local size = 0
local lastLetterSize = 0
for i,code in utf8.codes(name) do
	if (code < 128) then
		size += 1
	else
		size += 2
	end
	lastLetterSize = #utf8.char(code)
end
return size, lastLetterSize
end