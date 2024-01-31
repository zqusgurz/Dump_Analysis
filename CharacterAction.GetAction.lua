return function (self,actionName) 
self:EnsureInitialized()
return self.StringToAction[actionName]
end