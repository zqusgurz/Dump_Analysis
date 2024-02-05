return function (self,cd,sw) 
if (cd.Level > 10) then
	sw.StatNoviceGuide.Enable = false
else
	if (cd.Job == 0) then
		sw.StatNoviceGuide.Enable = true
	else
		sw.StatNoviceGuide.Enable = false
	end
end
end