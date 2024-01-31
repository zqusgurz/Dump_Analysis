return function (self,nextStateName) 
local actionEnd = self.ActionEnd
if (actionEnd == 0) then
	return false
end
return _UtilLogic.ServerElapsedSeconds > actionEnd
end