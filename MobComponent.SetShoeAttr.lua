return function (self) 
local rb = self.Entity.AdvancedRigidbodyComponent
local template = _MobTemplateMan:GetMobTemplate(self.MobTemplateID)
local mts = self.Entity.MobTemporaryStat

local totalSpeed = template.Speed + mts:GetValue(_MTS.Speed)
local hasImmovableStat = mts:HasImmovableStat()

if (hasImmovableStat) then
	rb.WalkSpeed = 0
else
	if (template.MoveAbility ~= _MoveAbility.None) then
		rb.WalkSpeed = math.min(140, math.max(10, totalSpeed)) / 100
	else
		rb.WalkSpeed = 0
	end
end

if (template.MoveAbility == _MoveAbility.Fly) then
	if (hasImmovableStat) then
		rb.FlySpeed = 0
	else
		rb.FlySpeed = math.min(140, math.max(10, totalSpeed)) / 100
	end
	rb.SwimSpeedV = math.min(140, math.max(10, totalSpeed)) / 100
	rb.SwimSpeedH = math.min(140, math.max(10, totalSpeed)) / 100
	rb.SwimAcceleration = 1
	rb.Gravity = 0
else
	rb.Gravity = 1
end

-- MoveAbility와 상관 없이 기본적으로 켜져있어야 한다.
rb.IsolatedMove = true

rb.WalkAcceleration = template.Fs
rb.WalkDrag = template.Fs

local mv = self.Entity.MovementComponent
mv.InputSpeed = 1
mv.JumpForce = 1
end