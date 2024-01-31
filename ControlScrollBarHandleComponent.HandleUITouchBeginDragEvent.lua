return function (self,event) 
-- 마우스 좌클릭 or 메인 터치만
if not (_InputUtils:IsPrimaryButton(event.TouchId)) then 
	return
end

self.Dragging = true
local scrollBar = self:GetScrollBar()
if (scrollBar:_IsVertical()) then
	self.Entity.SpriteGUIRendererComponent.ImageRUID = scrollBar._vbarHandlePressedRUID	
else
	
end
end