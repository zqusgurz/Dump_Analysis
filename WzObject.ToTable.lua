return function (self) 
local t = {}
for k,o in pairs(self.Children) do
	t[k] = _ResourceMan:ParseForTable(o)
end
return t
end