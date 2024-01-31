return function (self) 
local mob = self.Entity

-- 더 이상 공격 대상이 되지 않게..
mob.TriggerComponent.Enable = false
self:SetBodyAttackEnabled(false)

self:ClearFadeInTweener()
mob.MobAffectedComponent:ClearDelayedTimer()
mob.MobAffectedComponent:Clear()
mob.MobAffectedComponent:SetPoisonTimer(false)
mob.SpriteRendererComponent.Color = Color.white
_TimerService:ClearTimer(self.AttackTimer)
_TimerService:ClearTimer(self.AttackEffectTimer)
self.AttackTimer = 0
self.AttackEffectTimer = 0
if (self.AttackEffectSN) then
	self.AttackEffectSN.EffectAnimationComponent:Destroy()
	self.AttackEffectSN = nil
end
end