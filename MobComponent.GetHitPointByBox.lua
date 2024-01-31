return function (self,box) 
local ret = _NumberUtils:IntersectBox(box, _NumberUtils:TriggerToBox(self.Entity.TriggerComponent))
return ret or self.Entity.TransformComponent.WorldPosition:ToVector2()
end