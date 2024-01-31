return function (self,add) 
self.AlertTime = _UtilLogic.ElapsedSeconds + add + 5
self.Alert = true
end