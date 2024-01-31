return function (self,reason) 
local mobSkillId = (reason >> 16) & 0xffff
local mobSkillLevel = reason & 0xffff
return mobSkillId, mobSkillLevel
end