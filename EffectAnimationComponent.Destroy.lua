return function (self) 
_ObjectPool:Release(self.Pool, self.Entity)
local callback = self.DestroyCallback
if (callback) then
	callback()
end
end