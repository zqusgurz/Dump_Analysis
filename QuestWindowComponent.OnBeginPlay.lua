return function (self) 
for _,id in ipairs(_QuestConstants.AvailableAreas) do
	local name = _QuestMan.AreaName[id]
	if (not name) then
		continue
	end
	local category = _SpawnService:SpawnByModelId("model://3ab7d05a-0a43-465c-be97-0d3c767eb130", "PooledQuestCategory-"..id, 
		Vector3.zero, self.QuestList)
	local c = category.QuestCategoryComponent
	c.Area = id
	--category.Visible = false
	category.Enable = false
	self.Categories[id] = category
end
end