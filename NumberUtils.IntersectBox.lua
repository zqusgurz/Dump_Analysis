return function (self,b1,b2) 
---@type BoxShape, BoxShape
local box1, box2 = b1, b2

-- 각 Box의 x, y 범위를 계산합니다.
local box1Left = box1.Position.x - box1.Size.x / 2
local box1Right = box1.Position.x + box1.Size.x / 2
local box1Bottom = box1.Position.y - box1.Size.y / 2
local box1Top = box1.Position.y + box1.Size.y / 2

local box2Left = box2.Position.x - box2.Size.x / 2
local box2Right = box2.Position.x + box2.Size.x / 2
local box2Bottom = box2.Position.y - box2.Size.y / 2
local box2Top = box2.Position.y + box2.Size.y / 2

-- 교집합 영역의 x, y 범위를 찾습니다.
local interLeft = math.max(box1Left, box2Left)
local interRight = math.min(box1Right, box2Right)
local interBottom = math.max(box1Bottom, box2Bottom)
local interTop = math.min(box1Top, box2Top)

-- 교집합 영역의 중심점을 계산합니다.
local interCenterX = (interLeft + interRight) / 2
local interCenterY = (interBottom + interTop) / 2

-- 교집합 영역이 존재하지 않으면 nil을 반환합니다.
if interLeft > interRight or interBottom > interTop then
	return nil
end

return Vector2(interCenterX, interCenterY)

---- Simple Intersect
--local t_lb = Vector2(box1.Position.x - (box1.Size.x / 2), box1.Position.y - (box1.Size.y / 2))
--local t_rt = Vector2(box1.Position.x + (box1.Size.x / 2), box1.Position.y + (box1.Size.y / 2))
--local m_lb = Vector2(box2.Position.x - (box2.Size.x / 2), box2.Position.y - (box2.Size.y / 2))
--local m_rt = Vector2(box2.Position.x + (box2.Size.x / 2), box2.Position.y + (box2.Size.y / 2))
--
--local i_lb = Vector2(math.max(t_lb.x, m_lb.x), math.max(t_lb.y, m_lb.y))
--local i_rt = Vector2(math.max(t_rt.x, m_rt.x), math.max(t_rt.y, m_rt.y))
--
--return i_lb, i_rt
end