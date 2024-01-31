return function (self) 
self._T.Start = 0
self._T.TimeOver = 0
self._T.Remain = -1
self._T.Running = false

self:DestroyRemain()
end