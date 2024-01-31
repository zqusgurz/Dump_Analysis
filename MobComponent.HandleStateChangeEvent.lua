return function (self,event) 
local CurrentStateName = event.CurrentStateName
local PrevStateName = event.PrevStateName

-- log(string.format("ChangeState  prev:%s  current:%s", PrevStateName, CurrentStateName))
self:ChangeAnimationByState(CurrentStateName)
self:UpdateTriggerBoxByState(CurrentStateName)

if (self:IsClient()) then
	local mob = self.Entity
	if (PrevStateName ~= CurrentStateName) then
		if (CurrentStateName == _MobAction.Die1) then
			-- SE_MOB_DIE 재생
			local dieSound = _EffectLogic:GetMobHitSound(0, self:GetLinkOriginTemplateId(), true)
			_SoundService:PlaySoundAtPos(dieSound, mob.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
			local template = self:GetTemplate()
			if (#template.Revives > 0) then
				local time = template.TotalAnimationTimes["die1"] or 0
				_TimerService:SetTimerOnce(function()
					mob:SendEvent(ShowReviveEvent())
				end, math.max(0, time - 0.03))
			end
		end
	end
	if (CurrentStateName == _MobAction.Regen) then
		-- 리젠동안 공격 해제
		self:SetBodyAttackEnabled(false)
		mob.TriggerComponent.Enable = false
	end
end
end