return function (self,job) 
if (not _DebugConstants.LoadSkill) then
	return
end

if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText(string.format("직업 스킬 데이터 (%s)", _Jobs:GetJobName(job, true)))
end

local book = _ResourceMan:ParseGenericWzCollection("Skill", string.format("%03d", job))
_SkillMan.Book[job] = book["info"]["icon"]["_ruid"]

local skillInfos = self._skills
local skills = book["skill"]
for key,obj in pairs(skills) do
	---@type SkillInfo
	local skill = {}
	skill.SkillId = tonumber(key)
	skill.MaxLevel = 0
	skill.MasterLevel = _WzUtils:GetInt32(obj["masterLevel"], 0)
	skill.LevelData = {}
	skill.Invisible = _WzUtils:GetBool(obj["invisible"], false)
	skill.Req = {}
	skill.Weapon = _WzUtils:GetInt32(obj["weapon"], 0) 
	skill.SkillType = _WzUtils:GetInt32(obj["skillType"], 0) 
	skill.ElemAttr = _ElementType.Physical
	skill.Icon = _WzUtils:GetString(obj["icon"]["_ruid"], "")
	skill.IconMouseOver = _WzUtils:GetString(obj["iconMouseOver"]["_ruid"], "")
	skill.IconDisabled = _WzUtils:GetString(obj["iconDisabled"]["_ruid"], "")
	skill.ActionsNum = 0
	skill.FinalAttack = {}
	local finalAttacks = obj["finalAttack"]
	if (finalAttacks) then
		for fa,weaponTypes in pairs(finalAttacks) do
			local finalAttackId = tonumber(fa)
			local weaponTypeList = {}
			for i,wt in _WzUtils:GetLabeled(weaponTypes) do
				weaponTypeList[i+1] = _WzUtils:GetInt32(wt, -1)
			end
			skill.FinalAttack[finalAttackId] = weaponTypeList
		end
	end
	skill.HitNum = 0
	skill.HitAfter = 0
	local hitEffect = obj["hit"]
	if (hitEffect ~= nil) then
		for k,_ in _WzUtils:GetLabeled(hitEffect) do
			skill.HitNum = tonumber(k)+1
		end
		skill.HitAfter = _WzUtils:GetInt32(hitEffect["hitAfter"], 0) / 1000
		
	end
	local act = obj["action"]
	if (act ~= nil) then
		skill.Actions = {}
		for i,val in _WzUtils:GetLabeled(act) do
			skill.Actions[tonumber(i)+1] = _WzUtils:GetString(val, nil)
			skill.ActionsNum = skill.ActionsNum + 1
		end
	end
	local level = obj["level"]
	if (level ~= nil) then
		local levelDatas = skill.LevelData
		for l,o in pairs(level) do
			local slv = tonumber(l)
			---@type SkillLevelData
			local levelData = {}
			levelData.acc = _WzUtils:GetInt32(o["acc"], 0)
			levelData.action = _WzUtils:GetString(o["action"], "")
			levelData.attackCount = _WzUtils:GetInt32(o["attackCount"], 0)
			levelData.ball = o["ball"]
			levelData.bulletConsume = _WzUtils:GetInt32(o["bulletConsume"], 0)
			levelData.bulletCount = _WzUtils:GetInt32(o["bulletCount"], 0)
			levelData.cooltime = _WzUtils:GetInt32(o["cooltime"], 0)
			levelData.criticalDamage = _WzUtils:GetInt32(o["criticalDamage"], 0)
			levelData.damage = _WzUtils:GetInt32(o["damage"], 0)
			levelData.eva = _WzUtils:GetInt32(o["eva"], 0)
			levelData.fixdamage = _WzUtils:GetInt32(o["fixdamage"], 0)
			levelData.hit = o["hit"]
			levelData.hp = _WzUtils:GetInt32(o["hp"], 0)
			levelData.hpCon = _WzUtils:GetInt32(o["hpCon"], 0)
			levelData.hs = _WzUtils:GetString(o["hs"], "")
			levelData.itemCon = _WzUtils:GetInt32(o["itemCon"], 0)
			levelData.itemConNo = _WzUtils:GetInt32(o["itemConNo"], 0)
			levelData.jump = _WzUtils:GetInt32(o["jump"], 0)
			levelData.lt = _WzUtils:GetVector(o["lt"])
			levelData.mad = _WzUtils:GetInt32(o["mad"], 0)
			levelData.mastery = _WzUtils:GetInt32(o["mastery"], 0)
			levelData.mdd = _WzUtils:GetInt32(o["mdd"], 0)
			levelData.mobCount = _WzUtils:GetInt32(o["mobCount"], 0)
			levelData.moneyCon = _WzUtils:GetInt32(o["moneyCon"], 0)
			levelData.mp = _WzUtils:GetInt32(o["mp"], 0)
			levelData.mpCon = _WzUtils:GetInt32(o["mpCon"], 0)
			levelData.pad = _WzUtils:GetInt32(o["pad"], 0)
			levelData.pdd = _WzUtils:GetInt32(o["pdd"], 0)
			levelData.prop = _WzUtils:GetInt32(o["prop"], 0)
			levelData.range = _WzUtils:GetInt32(o["range"], 0)
			levelData.rb = _WzUtils:GetVector(o["rb"])
			levelData.speed = _WzUtils:GetInt32(o["speed"], 0)
			levelData.time = _WzUtils:GetInt32(o["time"], 0)
			levelData.x = _WzUtils:GetInt32(o["x"], 0)
			levelData.y = _WzUtils:GetInt32(o["y"], 0)
			levelData.z = _WzUtils:GetInt32(o["z"], 0)
			levelDatas[slv] = levelData
			skill.MaxLevel = math.max(skill.MaxLevel, slv)
		end
	end
	skill.GetLevelData = function(s, level)
		return s.LevelData[level]
	end
	skill.GetBall = function(self)
		return self.RawObject["ball"]
	end
	skill.GetEffect = function(self, sub)
		if (sub ~= nil) then
			return self.RawObject["effect" .. sub]
		end
		return self.RawObject["effect"]
	end
	skill.GetMobEffect = function(self, sub)
		if (sub ~= nil) then
			return self.RawObject["mob" .. sub]
		end
		return self.RawObject["mob"]
	end
	skill.IsFinalAttack = function(self)
		return self.SkillType == 3
	end
	skill.GetHit = function(self)
		return self.RawObject["hit"]
	end
	skill.GetSpecial = function(self)
		return self.RawObject["special"]
	end
	skill.GetAction = function(self)
		if (self.ActionsNum == 1) then
			return self.Actions[1]
		elseif (self.ActionsNum > 1) then
			local r = _GlobalRand32:RandomIntegerRange(1, self.ActionsNum)
			return self.Actions[r]
		end
		return nil
	end
	skill.IsSatisfiedReq = function(self, _cd)
		---@type SkillInfo
		local s = self
		---@type WsCharacterData
		local cd = _cd
		for id,lv in pairs(s.Req) do
			if (cd:GetSkillLevel(id) < lv) then
				return false
			end
		end
		return true
	end
	
	local reqs = obj["req"]
	if (reqs ~= nil) then
		for s, lv in pairs(reqs) do
			skill.Req[tonumber(s)] = _WzUtils:GetInt32(lv, 0)
		end
	end
	
	local elemAttr = _WzUtils:GetString(obj["elemAttr"], "")
	if (elemAttr == "f") then skill.ElemAttr = _ElementType.Fire
	elseif (elemAttr == "i") then skill.ElemAttr = _ElementType.Ice
	elseif (elemAttr == "s") then skill.ElemAttr = _ElementType.Poison
	elseif (elemAttr == "l") then skill.ElemAttr = _ElementType.Light
	elseif (elemAttr == "h") then skill.ElemAttr = _ElementType.Holy
	end
	
	skill.RawObject = obj
	skillInfos[skill.SkillId] = skill
end
end