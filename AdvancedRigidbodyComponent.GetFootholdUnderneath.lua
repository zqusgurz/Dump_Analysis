return function (self,offsetY) 
local entity = self.Entity
local pos = entity.TransformComponent.WorldPosition:ToVector2()
pos.y += offsetY
local raycast = entity.CurrentMap.FootholdComponent:Raycast(pos, Vector2.down, 1000)
if (raycast ~= nil) then
	return raycast.Id
end
return 0
end