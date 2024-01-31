return function (self,sk,mobCount,damagePerMob,attacks,damageInfos,hitEffects,needControl) 
local p = _UserService.LocalPlayer
for i=1,mobCount do
	---@type EntityRef
	local mob = attacks[i].Mob
	---@type HitEffectInfo
	local hit = hitEffects[i]
	local index = (i-1)*damagePerMob
	local damagesPerMob = table.move(damageInfos, index+1, index+damagePerMob, 1, {})
	if (isvalid(mob)) then
		mob.MobComponent:AddHitDamageInfo(hit, damagesPerMob, damagePerMob)
		if (needControl) then
			---@type DamageInfo
			local damageInfo = damagesPerMob[1]
			if (damageInfo == nil) then
				continue
			end
			local ai = mob.MobAIComponent
			ai:TrySwitchController(p, sk, true)
			local knockback = damageInfo.KnockbackType
			local moveAbility = mob.MobComponent:GetMoveAbility()
			if (moveAbility ~= _MoveAbility.None) then
				if (Environment:IsMakerPlay()) then
					if (knockback == 0) then
						knockback = 1
					end
				end
			else
				knockback = 0
			end
			
			if (knockback > 0) then
				ai:SetControlling(false) -- 현재 몬스터를 컨트롤중이라면 중단한다.
				local delay = hit.Delay
				if (not mob.MobComponent.Fly) then
					delay -= 0.1
				end
				local function applyKnockback()
					if (moveAbility == _MoveAbility.Fly) then
						_MobKnockbackLogic:UpdateFlyKnockbackPath(mob, hit.Left, knockback)
					else
						_MobKnockbackLogic:UpdateKnockbackPath(mob, hit.Left, knockback)
					end
				end
				if (delay > 0) then
					_TimerService:SetTimerOnce(applyKnockback, delay)
				else
					applyKnockback()				
				end
			end
		end
	end
end
end