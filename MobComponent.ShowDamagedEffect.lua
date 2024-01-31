return function (self,d) 
local u = _UserService.LocalPlayer
u.EffectDisplayerComponent:Effect_HP(d, self.Entity.TransformComponent.WorldPosition, false, 1, true)
end