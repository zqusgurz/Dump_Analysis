return function (self,mob) 
local rb = mob.RigidbodyComponent
local fh = rb:GetCurrentFoothold()
if (fh == nil) then
	return false
end
local mc = mob.MobComponent
local map = mob.CurrentMap
local dir = mc:IsFacingLeft() and -1 or 1
local nextFh = map.FootholdComponent:GetFoothold(dir >= 0 and fh.NextFootholdId or fh.PreviousFootholdId)
if (nextFh ~= nil) then
	if (nextFh.Variance.x ~= 0) then
		return true
	end
	local precipice = (nextFh.EndPoint.y - nextFh.StartPoint.y) * dir < 0
	if (precipice) then
		local predicatePos = nextFh.StartPoint + Vector2(0.2 * dir, 0.01)
		local down = map.FootholdComponent:Raycast(predicatePos, Vector2.down, 1)
		if (down == nil) then
			return false
		end
	end
else
	local pos = (dir >= 0 and fh.EndPoint or fh.StartPoint)
	local predicatePos = pos + Vector2(0.2 * dir, 0.01)
	local down = map.FootholdComponent:Raycast(predicatePos, Vector2.down, 1)
	if (down == nil) then
		return false
	end
end
return true
end