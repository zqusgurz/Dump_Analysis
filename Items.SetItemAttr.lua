return function (self,s,a,v) 
local attr = s.Attr & ~a
if (v) then
	attr |= a
end
s.Attr = attr
end