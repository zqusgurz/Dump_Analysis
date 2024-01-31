return function (self) 
local elementNum = #self.Elements
local height = math.max(1, elementNum) * 36
self.MemberElements.UITransformComponent.RectSize.y = height
self.Entity.UITransformComponent.RectSize.y = 106 + height
return height
end