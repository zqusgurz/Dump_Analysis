return function (self,entity) 
local u = entity.UITransformComponent
if (isvalid(u)) then
	local cursor = _InputService:GetCursorPosition()
	--local size = u.RectSize
	--cursor -= Vector2(size.x, size.y / 2)
	u.anchoredPosition = cursor * _ControlWindowLogic.UIRatio
end
end