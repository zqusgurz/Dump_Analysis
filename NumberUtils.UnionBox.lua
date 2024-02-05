return function (self,box1,box2) 
---@param box BoxShape
---@return Vector2, Vector2
local function convertToLbRt(box)
	local lb = Vector2(box.Position.x - (box.Size.x / 2),
					   box.Position.y - (box.Size.y / 2))
	local rt = Vector2(box.Position.x + (box.Size.x / 2),
					   box.Position.y + (box.Size.y / 2))
	return lb, rt
end

local lb1, rt1 = convertToLbRt(box1)
local lb2, rt2 = convertToLbRt(box2)

local finalLb = Vector2(math.min(lb1.x, lb2.x), math.min(lb1.y, lb2.y))
local finalRt = Vector2(math.max(rt1.x, rt2.x), math.max(rt1.y, rt2.y))

return BoxShape((finalLb + finalRt) / 2, finalRt - finalLb, 0)
end