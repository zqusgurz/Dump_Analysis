return function (self,window) 
-- 화면을 넘어가는 창 좌표 조정
local ui = window.UITransformComponent
if not (isvalid(ui)) then
	return
end
local size = ui.RectSize
local pos = ui.anchoredPosition
local ratio = _ControlWindowLogic.UIRatio
if (pos.y > 0) then
	pos.y = 0
elseif (pos.y < -(_UILogic.ScreenHeight * ratio.y - size.y)) then
	pos.y = -(_UILogic.ScreenHeight * ratio.y - size.y)
end
if (pos.x < 0) then
	pos.x = 0
elseif (pos.x > _UILogic.ScreenWidth * ratio.x - size.x) then
	pos.x = _UILogic.ScreenWidth * ratio.x - size.x
end
end