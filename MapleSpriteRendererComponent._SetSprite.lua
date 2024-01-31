return function (self,index,firstChanged) 
local obj = self._obj[tostring(index)]
return self:_SetSpriteCanvas(obj, firstChanged)
end