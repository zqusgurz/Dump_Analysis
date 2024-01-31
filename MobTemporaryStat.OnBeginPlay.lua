return function (self) 
self.MaxStatId = _MTS._MAX_STAT_ID_
if (self:IsServer()) then
	self.NextUpdate = _UtilLogic.ServerElapsedSeconds + 4
end
end