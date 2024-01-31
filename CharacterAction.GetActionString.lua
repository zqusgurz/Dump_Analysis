return function (self,action) 
self:EnsureInitialized()
return self.ActionToString[action]
end