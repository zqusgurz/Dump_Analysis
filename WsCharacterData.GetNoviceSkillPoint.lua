return function (self) 
return math.max(0, math.min(self.Level - 1, 6)
	 - self:GetSkillLevel(_Skills.NOVICE_THROW_SNAIL)
	 - self:GetSkillLevel(_Skills.NOVICE_REGENERATION)
	 - self:GetSkillLevel(_Skills.NOVICE_MOVING_WITH_ACTIVITY))
end