return function (self) 
for _,r in ipairs(self.Skills.Children) do
	if (not r.Enable) then continue end
	r.SkillEntryComponent:SetSkill(r.SkillEntryComponent.SkillId)
end
end