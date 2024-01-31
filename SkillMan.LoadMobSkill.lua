return function (self) 
local mobSkills = _ResourceMan:ParseGenericWzCollection("Skill", "MobSkill")
for k,v in pairs(mobSkills) do
	local mobSkillID = tonumber(k)
	local levels = v["level"]
	local i = 1
	while true do
		local levelData = levels[tostring(i)]
		if (levelData == nil) then
			break
		end
		---@type MobSkillLevelData
		local data = {}
		data.Lt = _WzUtils:GetVector(levelData["lt"])
		data.Rb = _WzUtils:GetVector(levelData["rb"])
		data.Effect = levelData["effect"]
		data.Interval = _WzUtils:GetInt32(levelData["interval"], 0)
		data.MobEffect = levelData["mob"]
		data.AffectedEffect = levelData["affected"]
		data.MpCon = _WzUtils:GetInt32(levelData["mpCon"], 0)
		data.Time = _WzUtils:GetInt32(levelData["time"], 0)
		data.X = _WzUtils:GetInt32(levelData["x"], 0)
		data.Y = _WzUtils:GetInt32(levelData["y"], 0)
		data.Prop = _WzUtils:GetInt32(levelData["prop"], 0)
		data.HPBelow = _WzUtils:GetInt32(levelData["hp"], 0)
		data.Limit = _WzUtils:GetInt32(levelData["limit"], 0)
		data.SummonEffect = _WzUtils:GetInt32(levelData["summonEffect"], _MobSummonType.Regen)
		local sids = {}
		data.SummonIDs = sids
		if (mobSkillID == 200) then
			for sidx, val in _WzUtils:GetLabeled(levelData) do
				sids[#sids + 1] = val
			end
		end
		
		local mobSkillLevels = self.MobSkill[mobSkillID]
		if (mobSkillLevels == nil) then
			mobSkillLevels = {}
			self.MobSkill[mobSkillID] = mobSkillLevels
		end
		mobSkillLevels[i] = data
		
		i += 1
	end
end
end