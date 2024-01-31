return function (self,tabEntity,t,tabIndex) 
self.Tabs = t
self.TabIndex = tabIndex
self.LastTabIndex = t:GetMaxActivated()
self.TabEntity = tabEntity

local uiScale = 2

---@type Sprite
local tabLeft = _ResourcePreloadService:GetSprite(t._normalLeft)
local tabLeftWidth = tabLeft.Width * uiScale
---@type Sprite
local tabRight = _ResourcePreloadService:GetSprite(t._normalRight)
local tabRightWidth = tabRight.Width * uiScale

self.Left = _EntityUtils:CreateUIEntity(t._normalLeft, Vector2.zero, "Left", tabEntity)

local fillSize = t.Entity.UITransformComponent.RectSize.x / t:GetTabCount() - tabLeftWidth - tabRightWidth
self.Fill = _EntityUtils:CreateUIEntity(t._normalFill, Vector2(tabLeftWidth, 0), "Fill", tabEntity)
self.Fill.UITransformComponent.RectSize.x = fillSize

self.Right = _EntityUtils:CreateUIEntity(t._normalRight, Vector2(tabLeftWidth + fillSize, 0), "Right", tabEntity)

---@type Sprite
local iconSprite = _ResourcePreloadService:GetSprite(self:GetTabIconRUID(tabIndex))
self.Icon = _EntityUtils:CreateUIEntity(self:GetTabIconRUID(tabIndex), Vector2.zero, "Icon", self.Fill)
self.Icon.UITransformComponent.AlignmentOption = AlignmentType.Center
self.Icon.UITransformComponent.Pivot = Vector2.one / 2
self.Icon.UITransformComponent.anchoredPosition = Vector2(0, -1) * uiScale

tabEntity.UITransformComponent.RectSize = Vector2(
	self.Left.UITransformComponent.RectSize.x + 
	self.Right.UITransformComponent.RectSize.x + 
	self.Fill.UITransformComponent.RectSize.x,
	self.Left.UITransformComponent.RectSize.y)

return self
end