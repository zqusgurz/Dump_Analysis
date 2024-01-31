return function (self,skillId) 
if skillId == 13111006 or skillId == 3201005 or skillId == 4121003 or skillId == 4221003 or skillId == 33121005 then
	return 10
elseif skillId == 3121003 or skillId == 3221001 or skillId == 3221003 or skillId == 33101001 then
	return 20
elseif skillId == 4111005 or skillId == 14111002 then
	return 36
elseif skillId == 11101004 or skillId == 15111006 or skillId == 21100004 or skillId == 21110004 then
	return 60
elseif skillId == 15111007 then
	return 150
else
	return 0
end
end