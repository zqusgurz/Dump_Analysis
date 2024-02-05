return function (self,offset,width,height,scale) 
local underline = self.Underline
underline.Enable = false
_EntityUtils:SetUIEntitySafelyEx(underline, -(offset.x + 1), -offset.y - height, width + offset.x + 1, 1)
--local ult = underline.UITransformComponent
--ult.anchoredPosition = -offset
--ult.RectSize.x = width
--ult.RectSize.y = 1
--ult.anchoredPosition.y -= height
--ult.anchoredPosition.x = 0
--_ScreenResolutionLogic:AdjustGUIScale(underline, scale, true)
end