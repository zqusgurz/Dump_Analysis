return function (self) 
local mob = self.Entity
if (self:IsClient()) then
	mob.TriggerComponent.Enable = false
	self:SetBodyAttackEnabled(false)
end
local rb = mob.MobRigidbodyComponent
rb.Enable = true
local ai = mob.MobAIComponent
if (isvalid(ai)) then
	ai.Enable = true
end
mob.MovementComponent.Enable = true
mob.MobTemporaryStat:Clear()
self.RegisteredHitEffect = 0
self.RegisteredDamageInfo = 0
self.DeadType = -1
ai.LocalStartChase = Vector2.zero
ai.LocalStartChaseZMass = 0
ai.Target = nil
ai.TargetCancelTime = 0
local template = _MobTemplateMan:GetMobTemplate(self.MobTemplateID)
local moveAbility = template.MoveAbility
self.DefaultState = "IDLE"
self.Entity.SpriteRendererComponent.FlipX = false
self.DieAnimationDuration = template.TotalAnimationTimes["die1"] or 1
self.NoFlip = template.NoFlip
self.MoveAbility = moveAbility
self.Boss = template.Boss
self.Stolen = -1
self.Fly = moveAbility == _MoveAbility.Fly
self.Template = template
self:SetShoeAttr()
local kb = mob.MobKnockbackComponent
kb.PreviousGravity = rb.Gravity
kb.PreviousWalkDrag = rb.WalkDrag
kb.PreviousWalkSpeed = rb.WalkSpeed
kb.PreviousIsolatedMove = rb.IsolatedMove
local sp = mob.SpriteRendererComponent
sp.StartFrameIndex = 0
sp.EndFrameIndex = 2147483647
sp.Color = Color.white
if (self:IsClient()) then
	mob.MobAffectedComponent:ClearDelayedTimer()
	mob.MobAffectedComponent:Clear()
	mob.MobAffectedComponent:SetPoisonTimer(false)
	self:ConnectSpriteFrameChangedEvent(false, nil)
	_MetaAnimationMan:DestroyEntityFrameTweeener(mob)
	self:DisconnectShowReviveEvent()
end
self.AttackEffectSN = nil
end