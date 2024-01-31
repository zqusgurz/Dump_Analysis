return function (self,s,a,v) 
local attr = s.PetSkill & ~a
if (v) then
	attr |= a
end
s.PetSkill = attr
end