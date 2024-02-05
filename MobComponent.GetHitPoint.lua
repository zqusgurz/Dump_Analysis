return function (self,trigger) 
local ret = _NumberUtils:IntersectBox(_NumberUtils:TriggerToBox(trigger), _NumberUtils:TriggerToBox(self.Entity.TriggerComponent))
return ret or self.Entity.TransformComponent.WorldPosition:ToVector2()
end