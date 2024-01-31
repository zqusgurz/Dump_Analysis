return function (self,damage) 
local pos = self.Entity.TransformComponent.WorldPosition:Clone()
_UserService.LocalPlayer.EffectDisplayerComponent:Effect_HP(damage, pos, false, 1, true)
end