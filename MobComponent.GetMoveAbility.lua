return function (self) 
local myMoveAbility = self.MoveAbility
if (myMoveAbility == -1) then
	local template = _MobTemplateMan:GetMobTemplate(self.MobTemplateID)
	myMoveAbility = template.MoveAbility
	self.DefaultState = "IDLE"
	self.MoveAbility = myMoveAbility
end
return myMoveAbility
end