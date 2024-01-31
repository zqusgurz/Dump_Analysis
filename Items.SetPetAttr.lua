return function (self,s,a,v) 
local attr = s.PetAttr & ~a
if (v) then
	attr |= a
end
s.PetAttr = attr
end