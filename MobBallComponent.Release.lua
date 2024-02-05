return function (self) 
self:Destroy()
_ObjectPool:Release(self.Pool, self.Entity)
end