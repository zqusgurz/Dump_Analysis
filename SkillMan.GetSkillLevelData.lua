return function (self,skillId,skillLevel) 
local skl = self:GetSkill(skillId)
if (skl == nil) then return nil end
return skl.LevelData[skillLevel]
end