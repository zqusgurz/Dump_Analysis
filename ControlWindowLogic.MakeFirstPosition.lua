return function (self,uiEntity,screenRatioPos) 
-- 해상도 / _ControlWindowLogic.UIRatio = UI Group RectSize
local ui = uiEntity.UITransformComponent
--local size = ui.RectSize * _ControlWindowLogic.UIRatio
--local rect = Vector2(_UILogic.ScreenWidth, _UILogic.ScreenHeight) - size
--local pos = rect * screenRatioPos
local size = ui.RectSize
local rect = Vector2(1920, 1080) - size
local pos = rect * screenRatioPos

ui.anchoredPosition = Vector2(pos.x, -pos.y)
--log(string.format("[%s] ratio:[%.2f,%.2f] scale:[%.2f,%.2f] size=[%.2fx%.2f] rect=[%.2fx%.2f] pos=[%.2f,%.2f]",
--		uiEntity.Name, screenRatioPos.x, screenRatioPos.y, scale.x, scale.y, size.x, size.y, rect.x, rect.y, pos.x, pos.y))
end