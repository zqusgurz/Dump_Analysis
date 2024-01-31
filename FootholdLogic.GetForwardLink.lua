return function (self,map,_fh,dir,x,len) 
---@type Foothold
local fh = _fh
if (fh == nil) then
	return nil
end
if (dir == 0) then
	return fh
end
local remainingLen = len
local var = fh.Variance
local footholdLen
if (dir < 0) then
	footholdLen = var.x * (x - fh.StartPoint.x)
else
	footholdLen = var.x * (fh.EndPoint.x - x)
end
remainingLen -= footholdLen
local fhs = map.FootholdComponent
local min = math.min
while remainingLen > 0 do
	if (dir < 0) then
		local prevId = fh.PreviousFootholdId
		if (prevId == 0) then
			return nil
		end
		fh = fhs:GetFoothold(prevId)
	else
		local nextId = fh.NextFootholdId
		if (nextId == 0) then
			return nil
		end
		fh = fhs:GetFoothold(nextId)
	end
	remainingLen -= min(remainingLen, fh.Length)
end
return fh
end