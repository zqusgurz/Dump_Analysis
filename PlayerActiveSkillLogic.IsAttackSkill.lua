return function (self,skillId) 
return self:IsMeleeAttackSkill(skillId) or
	self:IsShootAttackSkill(skillId) or
	self:IsMagicAttackSkill(skillId)
end