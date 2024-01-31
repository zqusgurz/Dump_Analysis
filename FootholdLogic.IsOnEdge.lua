return function (self,rb) 
if (not rb:IsOnGround()) then
	return true
end
local fh = rb:GetCurrentFoothold()
if (fh == nil) then
	return true
end

local function check(nextId)
	if (nextId == 0) then
		return true
	end
	local nextFh = rb.Entity.CurrentMap.FootholdComponent:GetFoothold(nextId)
	if (nextFh == nil) then
		return true
	end
	if (nextFh.Variance.x == 0) then
		return true
	end
	return false
end

if (check(fh.PreviousFootholdId)) then
	return true
end
if (check(fh.NextFootholdId)) then
	return true
end

return false
end