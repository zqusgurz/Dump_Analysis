return function (self) 
local now = _UtilLogic.ElapsedSeconds
if (self.LastSelectedTime + 0.5 < now) then
	return false
end
return true
end