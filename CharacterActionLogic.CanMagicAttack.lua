return function (self,state,skillId) 
if (state == "IDLE" or state == "MOVE" or state == "ALERT" or state == "FLY") then
	return true
end
if (skillId == _Skills.CLERIC_HEAL) then
	if (state == "JUMP" or state == "FALL") then
		return true
	end
end
return false
end