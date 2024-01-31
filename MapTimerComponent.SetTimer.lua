return function (self,timeOver) 
self._T.Start = 0
self._T.TimeOver = timeOver
self._T.Remain = -1
self._T.Running = true

self:DrawRemain(timeOver // 1000)
end