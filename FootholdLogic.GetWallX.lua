return function (self,map,footholdId,left) 
local fh = map.FootholdComponent:GetFoothold(footholdId)
if (left) then
	local lb = map.MapInfoComponent.BoundLb
	
	if (fh == nil) then
		return lb.x
	end
	local prev = map.FootholdComponent:GetFoothold(fh.PreviousFootholdId)
	if (prev == nil) then
		return fh.StartPoint.x
	end
	local pprev = map.FootholdComponent:GetFoothold(prev.PreviousFootholdId)
	if (pprev == nil) then
		return prev.StartPoint.x
	end
	return lb.x
else
	local rt = map.MapInfoComponent.BoundRt
	
	if (fh == nil) then
		return rt.x
	end
	local next = map.FootholdComponent:GetFoothold(fh.NextFootholdId)
	if (next == nil) then
		return fh.EndPoint.x
	end
	local nnext = map.FootholdComponent:GetFoothold(next.NextFootholdId)
	if (nnext == nil) then
		return next.EndPoint.x
	end
	return rt.x
end
end