return function (self,currentState) 
if (currentState == "PRONE" or currentState == "IDLE" or currentState == "MOVE" or currentState == "LADDER" or currentState == "CLIMB" or currentState == "ALERT") then
	return true
end
return false
end