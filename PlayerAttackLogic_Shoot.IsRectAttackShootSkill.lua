return function (self,skillId) 
if skillId == 13101005 or skillId == 4111005 or skillId == 3111004 or skillId == 3121003 
	or skillId == 3201005 or skillId == 3211004 or skillId == 3221001 or skillId == 3221003 
	or skillId == 4121003 or skillId == 4221003 or skillId == 5201001 or (skillId >= 5211004 and skillId <= 5211005)
	or skillId == 5221008 or skillId == 11101004 or skillId == 21120006 or skillId == 33121001 
	or skillId == 33121005 or skillId == 35121010 or skillId == 21110004 or skillId == 13111000 
	or skillId == 13111006 or skillId == 14101006 or skillId == 14111002 or skillId == 15111007 or skillId == 21100004 then
    return true
else
    return false
end
end