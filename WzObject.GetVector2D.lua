return function (self,propName,def) 
---@type WzObject
local o = self.Children[propName]
if (o == nil) then
	return def
end
return o:_GetValue_Vector2D()
end