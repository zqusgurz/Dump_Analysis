return function (self,map,footholdId,dir,cur,len) 
local fh = map.FootholdComponent:GetFoothold(footholdId)
if (fh == nil) then
	return footholdId
end

local remainingToEdge = dir < 0 and cur or (fh.Length - cur)
if (remainingToEdge >= len) then
	return footholdId
end

repeat 
	if dir >= 0 then
		footholdId = fh.NextFootholdId
	else
		footholdId = fh.PreviousFootholdId
	end
	fh = map.FootholdComponent:GetFoothold(footholdId)
	if (fh == nil) then
		return 0
	end
	
	-- Is wall?
	if (fh.StartPoint.x == fh.EndPoint.x) then
		break
	end
	
	-- Go forward
	len = len - fh.Length
until len <= 0
return footholdId
end