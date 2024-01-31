return function (self,nextStateName) 
if (self.ActionEnd == 0) then
	return false
end
return _UtilLogic.ServerElapsedSeconds >= self.ActionEnd
end