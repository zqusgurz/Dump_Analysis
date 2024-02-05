return function (self,delta) 
local scrollBar = self:GetScrollBar()
local baseSize = scrollBar._barBase.UITransformComponent.RectSize
local barSize = self.Entity.UITransformComponent.RectSize
local adjustedBaseSize = baseSize - barSize
local movedNormalizedPos = Vector2(delta.x / adjustedBaseSize.x, -delta.y / adjustedBaseSize.y)

-- FIXME Horizontal
self.Normalized += movedNormalizedPos.y -- * math.max(1, 1080 / _ScreenResolutionLogic.CurrentResolution.y)
if (self.Normalized < 0) then
	self.Normalized = 0
elseif (self.Normalized > 1) then
	self.Normalized = 1
end
scrollBar.ScrollView:SetScrollNormalizedPosition(UITransformAxis.Vertical, self.Normalized)

--if (scrollBar:_IsVertical()) then
--    local currentNormalizedPos = scrollBar.ScrollView:GetScrollNormalizedPosition(UITransformAxis.Vertical)
--    scrollBar.ScrollView:SetScrollNormalizedPosition(UITransformAxis.Vertical, currentNormalizedPos + movedNormalizedPos.y)
--    self:UpdateScrollBarPosition(Vector2(0, currentNormalizedPos))
--else
--    local currentNormalizedPos = scrollBar.ScrollView:GetScrollNormalizedPosition(UITransformAxis.Horizontal)
--    scrollBar.ScrollView:SetScrollNormalizedPosition(UITransformAxis.Horizontal, currentNormalizedPos + movedNormalizedPos.x)
--    self:UpdateScrollBarPosition(Vector2(currentNormalizedPos, 0))
--end
end