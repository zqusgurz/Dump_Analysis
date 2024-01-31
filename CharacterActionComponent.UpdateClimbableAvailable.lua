return function (self) 
local state = self.Entity.StateComponent.CurrentStateName
local available = _CharacterActionLogic:IsOnLadderOrRope(state)
if (not available) then
	if (_CharacterActionLogic:IsClimbableState(state)) then
		available = self:CheckNextClimbableTime()
	end
end
if (self._T.MoveUpAvailable ~= available) then
	self._T.MoveUpAvailable = available
	for _,c in ipairs(self.Entity.CurrentMap.MapInfoComponent.AllClimbables) do
		c.Enable = available
	end
end
end