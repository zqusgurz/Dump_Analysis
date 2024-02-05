return function (self) 
if (_UtilLogic.ElapsedSeconds < self.NextClimbAvailable) then
	return false
end
return true
end