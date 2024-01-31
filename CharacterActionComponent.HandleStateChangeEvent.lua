return function (self,event) 
local CurrentStateName = event.CurrentStateName
local PrevStateName = event.PrevStateName
if (_CharacterActionLogic:IsOnLadderOrRope(PrevStateName)) then
	self.Entity.MovementComponent.Enable = true
end
self:UpdateBodyRect(CurrentStateName)
self:UpdateHeadPosition(CurrentStateName)
end