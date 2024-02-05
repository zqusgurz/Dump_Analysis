return function (self,userJob,checkJob) 
if (checkJob % 100 == 0) then
	return userJob // 100 == checkJob // 100
else
	return checkJob // 10 == userJob // 10 and userJob % 10 >= checkJob % 10
end
end