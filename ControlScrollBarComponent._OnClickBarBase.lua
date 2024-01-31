return function (self,event) 
-- 마우스 좌클릭 or 메인 터치만
if not (_InputUtils:IsPrimaryButton(event.TouchId)) then 
	return
end

local dimension = _ControlWindowLogic:GetGUIDimension(self._barBase)
local pos = event.TouchPoint * dimension.UIRatio
local barHandleSize = self._barHandle.UITransformComponent.RectSize
local baseSize = self._barBase.UITransformComponent.RectSize
local barRatio = baseSize / (baseSize - barHandleSize)

-- 원래 이거 없이도 잘 되어야 하는데, 모르겠다.
-- pos.y = pos.y - barHandleHeight
-- pos *= barRatio

local deltaPos = pos - dimension.BasePosition
local normalized = deltaPos / baseSize
if (self:_IsVertical()) then
	self.ScrollView:SetScrollNormalizedPosition(UITransformAxis.Vertical, (1 - normalized.y))
else
	self.ScrollView:SetScrollNormalizedPosition(UITransformAxis.Horizontal, normalized.x)
end
end