return function (self,skillId,key) 
local obj = self.SoundSkill[skillId]
if (obj == nil or key == nil) then return nil end
return obj[key]
end