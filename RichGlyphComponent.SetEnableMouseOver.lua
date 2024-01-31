return function (self,mode,offset,width,height,unitHeight,scale) 
local rect = self.MouseOverRect
if (mode == 1) then
	_EntityUtils:SetUIEntitySafelyEx(rect, 0, -(unitHeight - height), width, unitHeight)
	--_EntityUtils:SetUIEntitySafelyEx(rect, -(offset.x + 1), 0, width + offset.x + 1, height * ratio)
    --self.MouseOverRect.UITransformComponent.anchoredPosition = -offset
    --self.MouseOverRect.UITransformComponent.RectSize.x = width
    --self.MouseOverRect.UITransformComponent.RectSize.y = height
    --_ScreenResolutionLogic:AdjustGUIScale(self.MouseOverRect, scale, true)
end
if (mode == 0) then
	rect.Enable = false
elseif (mode == 2) then
	rect.Enable = true
end
end