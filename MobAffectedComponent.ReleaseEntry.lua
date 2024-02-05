return function (self,entry) 
if (not entry.Entity) then
	return
end
if (entry.MobEffectPos == 2) then
	_ObjectPool:ReleaseEx(self.HeadAnimationPool, entry.Entity, true)
else
	_ObjectPool:ReleaseEx(self.MobAnimationPool, entry.Entity, true)
end
end