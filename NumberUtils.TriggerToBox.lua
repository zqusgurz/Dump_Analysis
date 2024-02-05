return function (self,t) 
return BoxShape(t.Entity.TransformComponent.WorldPosition:ToVector2() + t.ColliderOffset, t.BoxSize, 0)
end