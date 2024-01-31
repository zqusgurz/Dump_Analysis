return function (self) 
if (self.LastPortalRequest + 0.5 > _UtilLogic.ServerElapsedSeconds) then
	return false
end
return true
end