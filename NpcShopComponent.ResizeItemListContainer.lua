return function (self,parentContainer,count,resetPosition) 
local totalHeight = 35 * count + 4 * (count - 1)
local scrollLayout = parentContainer.Parent.ScrollLayoutGroupComponent
_EntityUtils:SetRectSizeUIEntitySafelyEx(parentContainer, nil, totalHeight)
if (resetPosition) then
	scrollLayout:ResetScrollPosition(UITransformAxis.Vertical)
	parentContainer.Parent:SendEvent(ScrollPositionChangedEvent(Vector2.zero))
end
end