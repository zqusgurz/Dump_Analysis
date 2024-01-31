return function (self,state) 
if (state == "IDLE" or state == "MOVE" or state == "FALL" or state == "JUMP" or state == "ALERT" or state == "FLY") then
	return true
end
return false
end