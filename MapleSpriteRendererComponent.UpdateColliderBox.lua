return function (self,anim) 
local entity = self.Entity
local hit = entity.HitComponent
local trigger = entity.TriggerComponent

if (isvalid(hit)) then
	if (anim.CollisionOffset ~= nil and anim.BoxSize ~= nil) then
		if (self:IsFacingLeft()) then
			hit.ColliderOffset.x = -anim.CollisionOffset.x
		else
			hit.ColliderOffset.x = anim.CollisionOffset.x
		end
		hit.ColliderOffset.y = anim.CollisionOffset.y
		hit.BoxSize = anim.BoxSize
	end
end
if (isvalid(trigger)) then
	if (anim.CollisionOffset ~= nil and anim.BoxSize ~= nil) then
		if (self:IsFacingLeft()) then
			trigger.ColliderOffset.x = -anim.CollisionOffset.x
		else
			trigger.ColliderOffset.x = anim.CollisionOffset.x
		end
		trigger.ColliderOffset.y = anim.CollisionOffset.y
		trigger.BoxSize = anim.BoxSize
	end
end
local ba = self.BodyAttack
if (isvalid(ba) and ba.EnableInHierarchy) then
	local baOffset = ba.ColliderOffset
	if (not self:IsFacingLeft()) then
		baOffset.x = -anim.CollisionOffset.x
	else
		baOffset.x = anim.CollisionOffset.x
	end
	baOffset.y = math.max(anim.CollisionOffset.y - math.min(anim.BoxSize.y / 2, 0.1))
	local baBox = ba.BoxSize
	baBox.x = math.max(anim.BoxSize.x - 0.5, 0.02)
	baBox.y = math.max(anim.BoxSize.y - 0.4, 0.02)
	if (isvalid(ba.Entity.ColliderVisualizer)) then
		ba.Entity.ColliderVisualizer:OnRefresh(TriggerComponent)
	end
end

local colliderVisualizer = entity.ColliderVisualizer
if (isvalid(colliderVisualizer)) then
	if (isvalid(hit)) then
		colliderVisualizer:OnRefresh(HitComponent)
	elseif (isvalid(trigger)) then
		colliderVisualizer:OnRefresh(TriggerComponent)
	end
end
end