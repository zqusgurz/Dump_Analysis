return function (self,foothold) 
if (foothold == nil) then
	return Vector2.zero
end

---@type Foothold
local fh = foothold
local xGap = fh.EndPoint.x - fh.StartPoint.x
local yGap = fh.EndPoint.y - fh.StartPoint.y
--local len = math.sqrt(xGap * xGap + yGap + yGap)
local len = fh.Length
return Vector2(xGap / len, yGap / len)
end