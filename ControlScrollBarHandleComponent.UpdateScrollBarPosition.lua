return function (self,normalizedPos) 
local scrollBar = self:GetScrollBar()
local baseSize = scrollBar._barBase.UITransformComponent.RectSize
local barSize = self.Entity.UITransformComponent.RectSize

if (scrollBar:_IsVertical()) then
	self.Entity.UITransformComponent.anchoredPosition.y = scrollBar._buttonNext.UITransformComponent.RectSize.y +
		(baseSize.y - barSize.y) * (1 - normalizedPos.y)
	if (not self.Dragging) then
	    self.Normalized = normalizedPos.y
	end	
    --self._T.BarNormalizedPos = normalizedPos.y
else
	self.Entity.UITransformComponent.anchoredPosition.x = (baseSize.x - barSize.x) * normalizedPos.x
end
end