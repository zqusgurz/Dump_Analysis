return function (self) 
local u = self.CursorGroup.UITransformComponent
if (isvalid(u)) then
	local cursorPos = _InputService:GetCursorPosition()
	local ss = Vector2(cursorPos.x / _UILogic.ScreenWidth, cursorPos.y / _UILogic.ScreenHeight)
	u.AnchorsMin = ss
	u.AnchorsMax = ss
	u.anchoredPosition = Vector2.zero
end
end