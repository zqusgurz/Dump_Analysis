return function (self,affected) 
if (affected.EffectSN and affected.EffectSN > 0) then
	_EffectService:RemoveEffect(affected.EffectSN)
	affected.EffectSN = 0
end
if (isvalid(affected.EffectEntity)) then
	affected.EffectEntity.EffectAnimationComponent:Destroy()
	affected.EffectEntity = nil
end
end