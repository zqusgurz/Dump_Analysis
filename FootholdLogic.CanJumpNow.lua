return function (self,mob,inputX,curPos) 
local rb = mob.RigidbodyComponent
local fh = rb:GetCurrentFoothold()
if (fh == nil) then
	return false
end
if (inputX == 0) then
	if (mob.RigidbodyComponent.RealMoveVelocity.x ~= 0) then
		return false
	end
end
local mc = mob.MobComponent
local map = mob.CurrentMap
if (inputX ~= nil) then
	local nextFhId = self:GetForwardLinkedFoothold(map, fh.Id, inputX, curPos, 1.1)
	if (nextFhId == 0) then
		return false
	end
	local nextFh = map.FootholdComponent:GetFoothold(nextFhId)
	if (nextFh.Variance.x == 0 and inputX * (nextFh.EndPoint.y - nextFh.StartPoint.y) < 0) then
		return false
	end
end
--local mobLocalPos = mob.TransformComponent.WorldPosition:ToVector2()
--local dir = mob.MobComponent:IsFacingLeft() and -1 or 1
--local raycast = map.FootholdComponent:Raycast(mobLocalPos, Vector2(dir, 0), 1)
--if (raycast ~= nil) then
--    if (raycast.Variance.x == 0) then
--        local wallBeyond = Vector2(raycast.StartPoint.x + dir * 0.1, mobLocalPos.y)
--        local nextRaycast = map.FootholdComponent:Raycast(wallBeyond, Vector2(dir, 0), 1000)
--        if (nextRaycast == nil) then
--            log ("too close with wall?")
--            return false
--        else
--            log_warning("found wall?")
--        end
--    end
--end
return true
end