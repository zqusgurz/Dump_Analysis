return function (self) 
if (self.SkillId == 0) then return end
if (_Skills:IsPassiveSkill(self.SkillId)) then return end
_PlayerActiveSkillLogic:DoActiveSkill(self.SkillId, false)
end