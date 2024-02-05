return function (self,entity) 
local u = entity.UITransformComponent
local size = u.RectSize
local tooltip = entity.TooltipBaseComponent
local ratio = _ControlWindowLogic.UIRatio

-- 일단 이동
local pos = _InputService:GetCursorPosition() * ratio

local maxX = (_UILogic.ScreenWidth * ratio.x) - size.x
if (pos.x > maxX) then
	pos.x = maxX
end
pos.y -= size.y
if (pos.y < 0) then
	pos.y = 0
end

--[[
if (tooltip.Anchor.x == -1) then -- Left
	if (pos.x > _UILogic.ScreenWidth * ratio.x - size.x) then
		-- 우측으로
		tooltip.Anchor.x = 1
		pos.x -= size.x
	end
elseif (tooltip.Anchor.x == 1) then -- Right
	if (pos.x < size.x) then
		-- 좌측으로
		tooltip.Anchor.x = -1
		pos.x += size.x
	else
		pos.x -= size.x
	end
end

if (tooltip.Anchor.y == -1) then -- Bottom
	if (pos.y > _UILogic.ScreenHeight * ratio.y - size.y) then
		-- 위쪽으로
		tooltip.Anchor.y = 1
		pos.y -= size.y
	end
elseif (tooltip.Anchor.y == 1) then -- Top
	if (pos.y < size.y) then
		-- 아래쪽으로
		tooltip.Anchor.y = -1
		pos.y += size.y
	else
		pos.y -= size.y
	end
end
]]--

u.anchoredPosition = pos
end