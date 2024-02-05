return function (self,cd,skillId) 
local upSkillJob = skillId // 10000
local jobLevel = _Jobs:GetJobLevel(upSkillJob)
if (jobLevel <= 1) then
	return true
end

local jobClass = _Jobs:GetJobClass(cd.Job)
local function getJobChangeLevel(jobLev)
	if (jobLev == 1) then
		if (jobClass == 2) then
			return 8
		else
			return 10
		end
	elseif (jobLev == 2) then
		return 30
	elseif (jobLev == 3) then
		return 70
	elseif (jobLev == 4) then
		return 120
	else
		return 200
	end
end
local function getMySkillDegreeSp(jobLev)
	if (jobLev < 0 or jobLev > 4) then
		return 0
	end
	local ret = 0
	for _,sr in pairs(cd.Skill) do
		local skillJob = sr.SkillId // 10000
		if (skillJob == 0) then
			continue
		end
		if (not self:CheckSkillRoot(cd, sr.SkillId)) then
			continue
		end
		local lv = sr.SkillLevel
		local srJobLevel = _Jobs:GetJobLevel(skillJob)
		if (srJobLevel == jobLev) then
			ret = ret + lv
		end
	end
	return ret
end
local function getMaxSkillDegreeSp(jobLev)
	if (jobLev < 0 or jobLev > 4) then
		return 0
	end
	local n = getJobChangeLevel(jobLev + 1)
	local m = n - getJobChangeLevel(jobLev)
	if (m <= 0) then
		return 0
	end
	local ret = 3 * m
	if (jobLev == 4) then
		return ret + 3
	else
		return ret + 1
	end
end

local totalMySkillDegreeSP = 0
local totalMaxSkillDegreeSP = 0
for i=1,_Jobs:GetJobLevel(cd.Job)-1 do
	totalMySkillDegreeSP = totalMySkillDegreeSP + getMySkillDegreeSp(i)
	totalMaxSkillDegreeSP = totalMaxSkillDegreeSP + getMaxSkillDegreeSp(i)
end

--log(string.format("jobLevel: %d  totalMySkillDegreeSP: %d  totalMaxSkillDegreeSP: %d", jobLevel, totalMySkillDegreeSP, totalMaxSkillDegreeSP))
if (totalMySkillDegreeSP < totalMaxSkillDegreeSP) then
	return false
end

--local currentSkillDegreeSP = getMySkillDegreeSp(jobLevel)
--local levelSp = 3 * cd.Level
--log(string.format("currentSkillDegreeSP: %d  levelSp: %d", currentSkillDegreeSP, levelSp))
--if (jobLevel == 2) then
--    return currentSkillDegreeSP < levelSp - 89
--elseif (jobLevel == 3) then
--    return currentSkillDegreeSP < levelSp - 209
--elseif (jobLevel == 4) then
--    return currentSkillDegreeSP < levelSp - 119
--end

return true
end