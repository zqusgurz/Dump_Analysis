return function (self,cd,skillId) 
local job = skillId // 10000
if (job == 0) then
	return true
end
local skillRoot = _Jobs:GetSkillRootFromJob(cd.Job)
for i=1,4 do
	if (job == skillRoot[i]) then
		return true
	end
end
--log_warning("failed to check skill root", cd.Job, job, skillRoot)
return false
end