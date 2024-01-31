return function (self,user,left,pos,wt,actionId,checkMeleeFromRange,actionRoot,fixedX) 
if (actionRoot == nil) then
	log_error(string.format("No action root"))
	return BoxShape(pos, Vector2.zero, 0)
end
---@type Vector2, Vector2
local lt, rb
if (checkMeleeFromRange and (wt == _WeaponType.Bow or wt == _WeaponType.Crossbow)) then
	if (actionId == _CharacterAction.STABT1) then
		lt = Vector2(-30, -26)
		rb = Vector2(0, -10)
	elseif (actionId == _CharacterAction.SWINGT1) then
		lt = Vector2(-30, -81)
		rb = Vector2(0, 5)
	elseif (actionId == _CharacterAction.SWINGT3) then
		lt = Vector2(-30, -73)
		rb = Vector2(0, 14)
	else
		lt = _WzUtils:GetVector(actionRoot.lt)
		rb = _WzUtils:GetVector(actionRoot.rb)
	end
else
	lt = _WzUtils:GetVector(actionRoot.lt)
	rb = _WzUtils:GetVector(actionRoot.rb)
end
if (fixedX ~= nil) then
	lt.x = math.min(lt.x, -fixedX)
end
---@type Vector2, Vector2
local center, size = _NumberUtils:GetTriggerBoxFromLtRb(lt, rb, left)
return BoxShape(pos + center, size, 0)
end