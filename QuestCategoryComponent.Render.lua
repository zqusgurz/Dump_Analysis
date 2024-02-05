return function (self,deselect) 
local areaName = _QuestMan.AreaName[self.Area] or "알 수 없음"
local quests = self.QuestIds
local questNum = #quests
---@type table<Entity>
local entities = self.QuestEntities
local entityNum = #entities
self.Text.Text = string.format("%s (%d)", areaName, questNum)

local function hideUnnessaceryEntities(start)
	for i=start,entityNum do
		entities[i].Enable = false
		--entities[i].Visible = false
	end
end

if (self.Spread) then
	hideUnnessaceryEntities(questNum+1)
	for i=1,questNum do
		local questId = quests[i]
		local entity = entities[i]
		if (deselect) then
			entity.QuestEntryComponent.Selected = false
		end
		entity.QuestEntryComponent:Render(questId, self.Tab)
		_EntityUtils:SetPositionUIEntitySafelyEx(entity, 0, -22 * (i-1))
		entity.Enable = true
		--entity.Visible = true
	end
	self.Height = 22 * (questNum + 1)
else
	hideUnnessaceryEntities(1)
	self.Height = 22
end

_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, nil, self.Height)
end