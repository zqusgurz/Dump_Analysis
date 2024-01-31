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
local mobTemplate = mob.MobComponent:GetTemplate()
local mts = mob.MobTemporaryStat
local int = bs.Int
local luk = bs.Luk
local userACC = 5 * ((int // 10) + (luk // 10))
local dLevel = math.max(0, mobTemplate.Level - cd.Level)
local mobMDD = math.min(math.max(0, mobTemplate.MDDamage + mts:GetValue(_MTS.Mdr)), _PlayerStatLogic.MaxMdd)
local mobEVA = math.min(math.max(0, mobTemplate.Eva + mts:GetValue(_MTS.Eva)), _PlayerStatLogic.MaxEva)
local accr = 100 * userACC / (10 * dLevel + 255)
local userMAD = self:GetUserMAD(user)
local weaponMastery = levelData.mastery
local minr = 0.9 * (10 + 5 * weaponMastery) / 100
local amp = self:GetAmplification(cd, 0, nil)
local invincible = _Jobs:IsAdmin(cd.Job)
local criticalParam = self:MakeIncOutParam()

for i=1, param.DamagePerMob do
	if (not invincible and mobTemplate.Invincible) then
		continue
	end
	if (mts:GetValue(_MTS.MImmune) ~= 0) then
		damages[i] = 1
		continue
	end
	if (ts:GetValue(_CTS.Seal) ~= 0) then
		continue
	end
	if (skillId > 0) then
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
	local accMin = accr * 0.5
	local accMax = accr * 1.2
	if (math.floor(_NumberUtils:GetRand(r(), accMin, accMax)) < mobEVA and not invincible) then
		continue
	end
	
	local primary, weaponConst, damageConst, damage
	if (skillId == _Skills.CLERIC_HEAL) then
		local targetCount = param.MobCount + math.max(1, param.PartyCount)
		local shareRate = 0
		if (targetCount > 0) then
			shareRate = (1 + targetCount * 0.3) / targetCount
		end
		local hp = levelData.hp / 100
		local startInt = 0.2 * int
		local rangeInt = 0.8 * int
		local secondary = luk
		weaponConst = 1.5
		damageConst = 1 / 2
		local primaryRand = _NumberUtils:GetRand(r(), startInt, rangeInt)
		local abilityBase = weaponConst * primaryRand + secondary
		damage = shareRate * hp * damageConst * abilityBase * userMAD / 100
	else
		primary = userMAD
		local v0 = userMAD * 0.058
		local secondary = v0 * v0 + int * 0.5
		weaponConst = 3.3
		damageConst = 1
		local primaryRand = _NumberUtils:GetRand(r(), primary * minr, primary)
		local abilityBase = weaponConst * primaryRand + secondary
		damage = damageConst * abilityBase * levelData.mad / 100
	end
	
	damage = self:GetDamageAdjustedByElemAttr(damage * amp / 100, skillId, skillLevel, mob, 1)
	
	-- isIgnoreMDefense
	local decByMdd = _NumberUtils:GetRand(r(), mobMDD * 0.5, mobMDD * 0.6)
	damage -= decByMdd
	
	-- isIgnoreMGuardUp
	local mGuardUp = mts:GetValue(_MTS.MGuardUp)
	if (mGuardUp ~= 0) then
		damage *= (mGuardUp / 100)
	end
	
	local originDamage = math.floor(damage)
	local damageR = 0
	if (damageR > 0) then
		damage *= damageR / 100
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
	damages[i] = math.min(math.max(1, math.floor(damage)), self.MaxDamage)
end
end