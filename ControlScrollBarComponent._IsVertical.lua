return function (self) 
local size = self.Entity.UITransformComponent.RectSize
local vertical = size.y > size.x

return vertical
end