return function (self,delta) 
local selfEntity = self.Entity
local target = self.Target
local targetPt = target.TransformComponent.WorldPosition + self.TargetHitOffset
targetPt.y -= self.FanShapeShootOffset
local t = selfEntity.TransformComponent
local dist = targetPt - t.WorldPosition
if (not self:IsTargetValid() or dist:Magnitude() < 0.15) then
	_ObjectPool:Release(self.ReturnPool, selfEntity)
	self.Enable = false
	return
end
local dir = dist:Normalize():ToVector2()
local offset = dir * delta / 0.15
local deg = _NumberUtils:Vector2ToDegree(dir)
if (deg <= 90 and deg >= -90) then
	t.WorldZRotation = deg
	self:SetBulletDirection(true)
else
	t.WorldZRotation = deg - 180
	self:SetBulletDirection(false)
end
t:Translate(offset.x, offset.y)
end