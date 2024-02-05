return function (self,cd,reward) 
local job = cd.Job // 100
local gender = cd.Gender
if (reward.JobFlag ~= 0) then
	if (job ~= 9) then
		if (((reward.JobFlag >> job) & 1) == 0) then
			return false
		end
	end
end
if (reward.Gender ~= 2) then
	if (gender ~= reward.Gender) then
		return false
	end
end
return true
end