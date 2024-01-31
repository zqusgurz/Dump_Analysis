return function (self,user,attacks,mobCount,skillId,skillLevel,left,makeKnockback) 
---@type table<DamageInfo>
local damageInfos = {}
local index = 1
for i=1,mobCount do
	---@type AttackInfo
	local a = attacks[i]
	for j=1,a.DamagePerMob do
		local mob = a.Mob
		
		---@type DamageInfo
		local damageInfo = {}
		damageInfo.Mob = mob
		damageInfo.SkillId = skillId
		damageInfo.Damage = a.DamageCli[j]
		damageInfo.Critical = a.CriticalCli[j]
		damageInfo.AttackIdx = j
		damageInfo.Chase = true
		damageInfo.Delay = self:MakeDelayPerDamage(j, skillId, a.DelayBase)
		damageInfo.Attacker = user.OwnerId
		damageInfo.Left = left
		
		damageInfo.HitPos = mob.TransformComponent.WorldPosition:Clone()
		--TODO Knockback 등 계산?
		-- 0~99 확률 < 넉백확률 만족시 
		--   단일타수 데미지 >= pushed
		--      만족시, 넉백 가능.
		local template = mob.MobComponent:GetTemplate()
		local isPowerKnockback = skillId == _Skills.HUNTER_POWER_KNOCKBACK or 
								 skillId == _Skills.CROSSBOWMAN_POWER_KNOCKBACK
		local addKnockbackProb = 0
		if (isPowerKnockback) then
			local levelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
			if (levelData ~= 0) then
				addKnockbackProb = levelData.prop
			end
		end
		damageInfo.KnockbackType = 0
		if (a.DamageCli[j] > 0) then
			if (a.DamageCli[j] >= template.Pushed) then
				damageInfo.KnockbackType = 1 -- Hit
				if (makeKnockback) then
					local function makeKnockbackType()
						local weaponKnockback = user.CharacterActionComponent.CurrentWeaponKnockbackProb
						local totalKnockbackProb = weaponKnockback + addKnockbackProb
						local rand = _GlobalRand32:RandomIntegerRange(0, 99)
						if (totalKnockbackProb > 0 and rand < totalKnockbackProb) then
							damageInfo.KnockbackType = 2 -- Knockback
						end
					end
					makeKnockbackType()
				end
			end
		end
	
		damageInfos[index] = damageInfo
		index += 1
	end
end
return damageInfos
end