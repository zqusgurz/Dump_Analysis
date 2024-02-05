return function (self,state) 
if (_CharacterActionLogic:IsJumpOrFall(state)) then
	self.FallSkillTick += 1
end
end