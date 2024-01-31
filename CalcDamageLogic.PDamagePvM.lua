return function (self,user,mob,num,skillId,skillLevel,p,damages,criticals) 
---@type CalcDamageParam
local param = p

local cursor = 0
local function r()
	local ret = num[(cursor % 7) + 1]
	cursor += 1 
	return ret 
end
local function r2() 
	local ret = num[(cursor & 7) + 1] 
	cursor += 1 
	return ret
end

---@type SkillLevelData
local levelData = nil
if (skillId ~= 0 and skillLevel > 0) then
	levelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
end

local weaponType = param.WeaponType
local cd = user.WsCharacterData
local ss = user.WsSecondaryStat
local bs = user.WsBasicStat
local ts = user.PlayerTemporaryStat
local userACC = ss.Acc
local mobTemplate = mob.MobComponent:GetTemplate()
local mts = mob.MobTemporaryStat
local dLevel = math.max(0, mobTemplate.Level - cd.Level)
local mobPDD = math.min(math.max(0, mobTemplate.PDDamage + mts:GetValue(_MTS.Pdr)), _PlayerStatLogic.MaxPdd)
local mobEVA = math.min(math.max(0, mobTemplate.Eva + mts:GetValue(_MTS.Eva)), _PlayerStatLogic.MaxEva)
local userPAD = self:GetUserPAD(user, param.BulletItemId)
local masteryOutParam = self:MakeIncOutParam()
local weaponMastery = _MasteryLogic:GetWeaponMastery(user, param.WeaponType, param.AttackType, skillId, masteryOutParam)
userACC += masteryOutParam.IncACC
userPAD += masteryOutParam.IncPAD
userACC = math.min(userACC, _PlayerStatLogic.MaxAcc)
local accr = 100 * userACC / (10 * dLevel + 255)
local minr = 0.9 * (10 + 5 * weaponMastery) / 100
local criticalParam = self:MakeIncOutParam()
_Skills:GetCriticalSkillLevel(user, param.WeaponType, param.AttackType, criticalParam)
local invincible = _Jobs:IsAdmin(cd.Job)

--log(string.format("userPAD:%d minr=%.2f str=%d dex=%d luk=%d", 
--		userPAD, minr, bs.Str, bs.Dex, bs.Luk))

for i=1, param.DamagePerMob do
	if (not invincible and mobTemplate.Invincible) then
		continue
	end
	if (skillId > 0 and ts:GetValue(_CTS.Seal) ~= 0) then
		continue
	end
	if (mts:GetValue(_MTS.PImmune) ~= 0) then
		damages[i] = 1
		continue
	end
	if (skillId > 0) then
		if (skillId == _Skills.PALADIN_SANCTUARY) then
			damages[i] = 1
			continue
		end
		if (levelData.fixdamage > 0) then
			accr = 100 * cd.Level / (15 * 10 * dLevel + 255)
			local accmin = accr * 0.7
			local accmax = accr * 1.3
			if (math.floor(_NumberUtils:GetRand(r(), accmin, accmax)) < mobEVA) then
				continue
			end
			damages[i] = levelData.fixdamage
			continue
		end
	end
	local accMin = accr * 0.7
	local accMax = accr * 1.3
	if (math.floor(_NumberUtils:GetRand(r(), accMin, accMax)) < mobEVA and not invincible) then
		continue
	end
	if (ts:GetValue(_CTS.Darkness) > 0) then
		local darknessProp = _NumberUtils:GetRand(r(), 0, 100)
		if (darknessProp > 20) then
			cursor += math.floor(_NumberUtils:GetRand(r(), 0, 5))
			continue
		end
	end
	
	local str = bs.Str
	local dex = bs.Dex
	local luk = bs.Luk
	local primary = 0
	local secondary = 0
	local weaponConst = 1
	local damageConst = 1
	local dam = -1
	if (not _CharacterAction:IsShootAction(param.Action) and (weaponType == _WeaponType.Bow or weaponType == _WeaponType.Crossbow)) then
		if (skillId == _Skills.HUNTER_POWER_KNOCKBACK or skillId == _Skills.CROSSBOWMAN_POWER_KNOCKBACK) then
			primary = dex
			secondary = str
			weaponConst = 3.4
			damageConst = 2 / 3
		else
			primary = dex
			secondary = str
			weaponConst = 3.4
			damageConst = 2 / 3
		end
	elseif (not _CharacterAction:IsShootAction(param.Action) and weaponType == _WeaponType.ThrowingGlove) then
		primary = luk
		secondary = str + dex
		weaponConst = 1
		damageConst = 2 / 3
	elseif (param.Action == _CharacterAction.PRONESTAB) then
		primary = str
		secondary = dex
		weaponConst = 1
		damageConst = 1 / 2
	else
		local swing = _CharacterAction:IsSwingAction(param.Action)
		if (weaponType == _WeaponType.OneHandedSword or weaponType == _WeaponType.Dagger) then
			if (_Jobs:GetJobClass(cd.Job) == 4 and weaponType == _WeaponType.Dagger) then
				primary = luk
				secondary = str + dex
				weaponConst = 3.6
				damageConst = 1
			else
				primary = str
				secondary = dex
				weaponConst = 4
				damageConst = 1
			end
		elseif (weaponType == _WeaponType.OneHandedAxe or weaponType == _WeaponType.OneHandedMace or
				weaponType == _WeaponType.Staff or weaponType == _WeaponType.Wand) then
			primary = str
			secondary = dex
			weaponConst = swing and 4.4 or 3.2
			damageConst = 1
		elseif (weaponType == _WeaponType.TwoHandedSword) then
			primary = str
			secondary = dex
			weaponConst = 4.6
			damageConst = 1
		elseif (weaponType == _WeaponType.TwoHandedAxe or weaponType == _WeaponType.TwoHandedMace) then
			primary = str
			secondary = dex
			weaponConst = swing and 4.8 or 3.4
			damageConst = 1
		elseif (weaponType == _WeaponType.Spear or weaponType == _WeaponType.PoleArm) then
			primary = str
			secondary = dex
			if (skillId == _Skills.DRAGONKNIGHT_DRAGON_ROAR) then
				weaponConst = 4 -- (3 + 5) / 2
			elseif (weaponType == _WeaponType.Spear) then
				weaponConst = swing and 3 or 5
			elseif (weaponType == _WeaponType.PoleArm) then
				weaponConst = swing and 5 or 3
			end
			damageConst = 1
		elseif (weaponType == _WeaponType.Bow) then
			primary = dex
			secondary = str
			weaponConst = 3.4
			damageConst = 1
		elseif (weaponType == _WeaponType.Crossbow) then
			primary = dex
			secondary = str
			weaponConst = 3.6
			damageConst = 1
		elseif (weaponType == _WeaponType.ThrowingGlove) then
			if (skillId == _Skills.ROGUE_LUCKY_SEVEN) then
				minr = 0.5
				primary = luk
				secondary = 0
				weaponConst = 5
				damageConst = 1
			elseif (skillId == _Skills.HERMIT_SHADOW_MESO) then
				local moneyCon = levelData.moneyCon
				local moneyStart = moneyCon / 2
				local moneyRange = 3 * moneyCon / 2
				dam = 10 * math.floor(_NumberUtils:GetRand(r(), moneyStart, moneyRange))
				local prop = math.floor(_NumberUtils:GetRand(r(), 0, 100))
				if (prop < levelData.prop) then
					dam *= (100 + levelData.x) / 100
					criticals[i] = true
				end
			else
				primary = luk
				secondary = str + dex
				weaponConst = 3.6
				damageConst = 1
			end
		end
	end
	
	local damage
	if (dam > 0) then
		damage = dam
	else
        --local max = math.floor((primaryMax + secondaryMax) * pad / 100)
        --local min = math.floor((primaryMin * 0.9 * mastery + secondaryMin) * pad / 100)
		--local minr = 0.9 * (10 + 5 * weaponMastery) / 100
		
		local primaryRand = _NumberUtils:GetRand(r(), primary * minr, primary)
		local abilityBase = weaponConst * primaryRand + secondary
		damage = damageConst * abilityBase * userPAD / 100
		--log(string.format("primaryRand: %.2f  abilityBase: %.2f  damage=%.2f", primaryRand, abilityBase, damage))
	end
	if (not invincible and (cd.Level < mobTemplate.Level)) then
		local decDamageByLevel = 100 - (mobTemplate.Level - cd.Level)
		damage *= decDamageByLevel / 100
	end
	damage = self:GetDamageAdjustedByElemAttr(damage, skillId, skillLevel, mob, 1)
	damage = self:GetDamageAdjustedByChargedElemAttr(damage, user, mob)
	if not (_Skills:IsIgnorePDef(skillId)) then
		local pddApply = _NumberUtils:GetRand(r(), 0.5 * mobPDD, 0.6 * mobPDD)
		damage -= pddApply
	end
	--log(string.format("current damage: %.2f", damage))
	local originDamage = math.floor(damage)
	if (skillId ~= 0 and levelData.damage > 0) then
		damage *= (levelData.damage / 100)
	end
	local comboDamageParam = self:GetComboDamageParam(user, skillId)
	if (comboDamageParam > 0) then
		damage *= (comboDamageParam / 100)
	end
	if not (self:IsIgnoreCritical(skillId)) then
		if (criticalParam.Prop > 0 and criticalParam.Damage > 0) then
			local rand = _NumberUtils:GetRand(r(), 0, 100)
			if (rand < criticalParam.Prop) then
				criticals[i] = true
				local incDamage = (criticalParam.Damage - 100) / 100
				damage += (originDamage * incDamage)
			end
		end
	end
	if (not self:IsIgnorePGuardUp(skillId)) then
		local val = mts:GetValue(_MTS.PGuardUp)
		if (val ~= 0) then
			damage *= (val / 100)
		end
	end
	if (param.ShadowPartner) then
		local beginIndex = param.DamagePerMob // 2
		if (i >= beginIndex) then
			local pSlv = cd:GetSkillLevel(_Skills.HERMIT_SHADOW_PARTNER)
			local pLevelData = _SkillMan:GetSkillLevelData(_Skills.HERMIT_SHADOW_PARTNER, pSlv)
			local damageParam = skillId ~= 0 and pLevelData.y or pLevelData.x
			damage = damages[i - beginIndex] * damageParam / 100
			criticals[i] = criticals[i - beginIndex] 
		end
	end
	damages[i] = math.min(math.max(1, math.floor(damage)), self.MaxDamage)
end
end