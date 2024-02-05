return function (self,entity,pos,fhId) 
local rb = entity.RigidbodyComponent
---@type Foothold
local currentFh = nil
local map = rb.Entity.CurrentMap.FootholdComponent
local entityPos = entity.TransformComponent.WorldPosition
if (fhId == nil) then
	currentFh = rb:GetCurrentFoothold()
else
	currentFh = map:GetFoothold(fhId)
end

if (currentFh ~= nil) then
	if (not self:IsOnEdge(rb)) then
		return true
	end
	local prev = currentFh.PreviousFootholdId
	local prevFh = map:GetFoothold(prev)
	if (prevFh ~= nil and prevFh.Variance.x == 0) then
		local diff = pos.x - currentFh.StartPoint.x
		if (diff < 0.1) then
			pos.x = currentFh.StartPoint.x + 0.1
			return true
		end
	end
	local next = currentFh.NextFootholdId
	local nextFh = map:GetFoothold(next)
	if (nextFh ~= nil and nextFh.Variance.x == 0) then
		local diff = currentFh.EndPoint.x - pos.x
		if (diff < 0.1) then
			pos.x = currentFh.EndPoint.x - 0.1
			return true
		end
	end
end
return false
--
--if (currentFh == nil) then
--    currentFh = map:GetNearestFootholdByPoint(pos, 1)
--    if (currentFh.StartPoint.y ~= entityPos.y) then
--        currentFh = nil
--    end
--    if (currentFh.Variance.x == 0) then
--        local prev = currentFh.PreviousFootholdId
--        local prevFh = map:GetFoothold(prev)
--        if (prevFh == nil or prevFh.Variance.x == 0) then
--            local next = currentFh.NextFootholdId
--            local nextFh = map:GetFoothold(next)
--            if (nextFh ~= nil and nextFh.Variance.x ~= 0) then
--                currentFh = nextFh
--            end
--        else
--            currentFh = prevFh
--        end
--    end
--    if (currentFh == nil) then
--        log_warning("failed to adjust edge position?")
--        return
--    end
--    if (currentFh.StartPoint:Distance(pos) < currentFh.EndPoint:Distance(pos)) then
--        pos.x = currentFh.StartPoint.x + 0.1
--        log("Adjust + 0.1")
--    else
--        pos.x = currentFh.EndPoint.x - 0.1
--        log("Adjust - 0.1")
--    end
--end

end