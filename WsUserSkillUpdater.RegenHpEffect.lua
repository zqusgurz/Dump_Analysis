return function (self,hp) 
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return -- NOTE: useless?
end

local pos = self.Entity.TransformComponent.WorldPosition:Clone()
self.Entity.EffectDisplayerComponent:Effect_HP(-hp, pos, false, 1, false)
end