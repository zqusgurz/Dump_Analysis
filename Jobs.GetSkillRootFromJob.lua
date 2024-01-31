return function (self,jobId) 
local skillRoots = {}
if jobId == 0 then
	return skillRoots
end
local insert = table.insert

local baseFactor = (jobId % 1000) // 100 + 10 * (jobId // 1000)
local base = 100 * baseFactor
insert(skillRoots, base)

local jobCategory = jobId % 100 // 10
if jobCategory <= 0 then
	return skillRoots
end

local updatedBase = base + jobCategory * 10
insert(skillRoots, updatedBase)

local jobLevel = jobId % 10
for increment = 1, jobLevel do
	updatedBase = updatedBase + 1
	insert(skillRoots, updatedBase)
end

return skillRoots
end