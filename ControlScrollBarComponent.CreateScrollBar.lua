return function (self) 
local size = _EntityUtils:GetRealRectSize(self.Entity)
local uiScale = 2

if (isvalid(self._buttonNext)) then
	self._buttonNext:Destroy()
end
if (isvalid(self._buttonPrev)) then
	self._buttonPrev:Destroy()
end
if (isvalid(self._barBase)) then
	self._barBase:Destroy()
end
if (isvalid(self._barHandle)) then
	self._barHandle:Destroy()
end
	
if (self:_IsVertical()) then
	-- NextButton
	---@type Sprite
	local nextBtnSprite = _ResourcePreloadService:GetSprite(self._vbarNextEnabledRUID)
	local nextBtnSpriteHeight = nextBtnSprite.Height * uiScale
	self._buttonNext = _EntityUtils:CreateUIEntity(self._vbarNextEnabledRUID, Vector2.zero, "NextButton", self.Entity)
	
	-- PrevButton
	---@type Sprite
	local prevBtnSprite = _ResourcePreloadService:GetSprite(self._vbarPrevEnabledRUID)
	local prevBtnSpriteHeight = prevBtnSprite.Height * uiScale
	self._buttonPrev = _EntityUtils:CreateUIEntity(self._vbarPrevEnabledRUID, Vector2(0, size.y - prevBtnSpriteHeight), "PrevButton", self.Entity)
	
	-- BarBase
	self._barBase = _EntityUtils:CreateUIEntity(self._vbarBaseEnabledRUID, Vector2(0, prevBtnSpriteHeight), "BarBase", self.Entity)
	self._barBase.UITransformComponent.RectSize.y = (size.y - nextBtnSpriteHeight - prevBtnSpriteHeight)
	self._barBase:AddComponent(UITouchReceiveComponent)
	self._barBase:ConnectEvent(UITouchDownEvent, self._OnClickBarBase)
	
	-- BarHandle
	---@type Sprite
	local barHandleSprite = _ResourcePreloadService:GetSprite(self._vbarHandleRUID)
	local barHandleSpriteHeight = barHandleSprite.Height * uiScale
	local barPos = Vector2(0, size.y - prevBtnSpriteHeight - barHandleSpriteHeight)
	self._barHandle = _EntityUtils:CreateUIEntity(self._vbarHandleRUID, barPos, "BarHandle", self.Entity)
	self._barHandle:AddComponent(ControlScrollBarHandleComponent)
	self._barHandle:AddComponent(UITouchReceiveComponent)
end

local scrollView = self.ScrollView
if (isvalid(scrollView)) then
	_ScrollEventHolder:OnCreateScrollbar(self, scrollView.Entity)
else
	self:SetInteractable(false)
end
end