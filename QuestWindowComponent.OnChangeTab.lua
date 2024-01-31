return function (self,tab) 
self.CurrentTab = tab
local totalY = 0
---@type table<Entity>
local categories = self.Categories
for id=0,100 do
	local category = categories[id]
	if (not category) then
		continue
	end
	local c = category.QuestCategoryComponent
	c.QuestState = tab
	c.Tab = tab
	c.Spread = true
	c:Update()
	if (c.Height > 0) then
		category.Enable = true
		_EntityUtils:SetPositionUIEntitySafelyEx(category, 0, -totalY)
		totalY += c.Height
		--category.Visible = true
	else
		category.Enable = false
		--category.Visible = false
	end
end

_EntityUtils:SetRectSizeUIEntitySafelyEx(self.QuestList, nil, totalY)

_QuestMan:SendEvent(ChangedSelectedQuestEntryEvent(nil, tab))
local scrollLayout = self.ScrollView.Entity.ScrollLayoutGroupComponent
scrollLayout.UseScroll = false
scrollLayout.UseScroll = true
_ScrollEventHolder:SendScrollbarEvent(self.ScrollView.Entity, nil, nil)
end