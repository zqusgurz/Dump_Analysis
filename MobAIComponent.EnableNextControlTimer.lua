return function (self,delay) 
_TimerService:ClearTimer(self.LocalNextControlTimer)
if (delay == nil) then
	return
end
local mob = self.Entity
local moveAbility = mob.MobComponent:GetMoveAbility()

local function generateMovePath()
	--log(string.format("Start generate move path  id:%d  moveAbility=%d", mob.MobComponent.MobTemplateID, moveAbility))
	if (moveAbility == _MoveAbility.Fly) then
		_MobFlyLogic:UpdateMovePath(mob)
	elseif (moveAbility == _MoveAbility.Jump or moveAbility == _MoveAbility.Walk) then
		_MobWalkLogic:UpdateMovePath(mob)
	end
end

if (delay > 0) then
	self.LocalNextControlTimer = _TimerService:SetTimerOnce(function()
		generateMovePath()
	end, delay)
else
	generateMovePath()
end
end