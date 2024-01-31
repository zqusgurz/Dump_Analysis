return function (self,now) 
self._T.ServerTimeDiff = DateTime.UtcNow.Elapsed - now
end