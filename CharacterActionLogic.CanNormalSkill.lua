return function (self,state) 
if (state == "IDLE" or state == "MOVE" or state == "FALL" or state == "JUMP" or state == "ALERT" or state == "FLY" or state == "CLIMB" or state == "LADDER") then
	return true
end
return false
end