return function (self,knockback) 
local mob = self.Entity
local rb = mob.MobRigidbodyComponent
if (knockback == 1) then
	rb.WalkSpeed = 1
	rb.WalkDrag = 10
elseif (knockback == 2) then
	rb.WalkSpeed = 2
	rb.WalkDrag = 10
else
	rb.WalkDrag = self.PreviousWalkDrag
	rb.WalkSpeed = self.PreviousWalkSpeed
	rb.Gravity = self.PreviousGravity
	rb.IsolatedMove = self.PreviousIsolatedMove
end
end