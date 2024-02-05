return function (self) 
local totalY = 0
---@type table<integer, Entity>
local categories = self.Categories
for id=0,100 do
	local category = categories[id]
	if (not category) then
		continue
	end
	local height = category.QuestCategoryComponent.Height
	if (not category.Enable or height == 0) then
		continue
	end
	_EntityUtils:SetPositionUIEntitySafelyEx(category, nil, -totalY)
	totalY += height
end
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.QuestList, nil, totalY)
local scrollLayout = self.ScrollView.Entity.ScrollLayoutGroupComponent
scrollLayout.UseScroll = false
scrollLayout.UseScroll = true
_ScrollEventHolder:SendScrollbarEvent(self.ScrollView.Entity, nil, nil)
-- self.QuestList.UITransformComponent.RectSize.y = totalY
end