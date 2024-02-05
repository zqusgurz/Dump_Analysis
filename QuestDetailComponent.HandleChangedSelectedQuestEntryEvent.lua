return function (self,event) 
local e = event.SelectedEntry
---@type table<Entity>
local spots = self.GaugeSpots
if (#spots > 0) then
	for i=1,#spots do
		spots[i].Visible = false
		_ObjectPool:Release(self.GaugeSpotPool, spots[i])
	end
	self.GaugeSpots = {}
end
self.SelectedQuestId = 0

self.Entity.Enable = e ~= nil
local t = self.Gauge.QuestSeriesTooltipComponent
t:RemoveTooltip()
t.TooltipText = ""
if (e ~= nil) then
	local questEntry = e.QuestEntryComponent
	local tab = event.Tab
	local questId = questEntry.QuestId
	self.SelectedQuestId = questId
	---@type QuestDemand
	local startDemand = _QuestMan.StartDemand[questId]
	
	local name = _QuestMan.SeriesQuest[questId] or _QuestMan.QuestName[questId] or "알 수 없음"
	self.QuestName.Text = name
	
	local cd = _UserService.LocalPlayer.WsCharacterData
	local questState = _UserQuestLogic:GetQuestState(cd, questId)
	if (questState == 2) then
		local completed = cd.QuestCompleted[questId]
		if (completed ~= nil) then
			local localTime = _UtilLogic:GetLocalTimeFrom(DateTime(completed))
			self.Requirement.Text = string.format("%04d년 %d월 %d일 %02d시 완료",
					localTime.Year, localTime.Month, localTime.Day, localTime.Hour)
		else
			self.Requirement.Text = ""
		end
	else
		local requirements = {}
		if (startDemand.LvMin ~= 0) then
			table.insert(requirements, string.format("레벨 %d이상", startDemand.LvMin))
		end
		if (startDemand.LvMax ~= 0) then
			table.insert(requirements, string.format("레벨 %d이하", startDemand.LvMax))
		end
		self.Requirement.Text = table.concat(requirements, " ")
	end
	
	local desc = {}
	
	---@type QuestInfo	
	local info = _QuestMan.Info[questId]
	local series = _QuestMan.SeriesQuest[questId]
	if (series and tab == 1) then
		local max = _QuestMan.SeriesQuestMaxOrder[series]
		local order = info.Order
		if (questState < 2) then
			order -= 1
		end
		self.Gauge.Enable = true
		self.GaugeBar.FillAmount = order / max
		for i=1,max-1 do
			local x = 15 + (147 / max) * i
			local spot = _ObjectPool:Pick(self.GaugeSpotPool, "PooledSpot", "model://c8c9f426-d831-4890-bc42-19589a12683c", Vector3.zero, self.Gauge)
			_EntityUtils:SetPositionUIEntitySafelyEx(spot, x, 2)
			_UpdateComponentLogic:InsertUpdateVisible(spot)
			self.GaugeSpots[i] = spot
		end
		t.TooltipText = string.format("연속퀘스트 ( %d / %d )", order, max)
		table.insert(desc, info.Name)
		table.insert(desc, "\n")
	else
		self.Gauge.Enable = false
	end
	
	local template = _NpcTemplateMan:GetNpcTemplate(startDemand.Npc)
	if (template.Imitate > 0) then
		self.Avatar.Enable = true
		self.Npc.Entity.Enable = false
		self:UpdateImitationNpcLook(startDemand.Npc)
	else
		self.Avatar.Enable = false
		self.Npc.Entity.Enable = true
		self.Npc.ImageRUID = _NpcTemplateMan:EnsureStandAnimation(startDemand.Npc)
		-- self.Npc.LocalScale = _ScreenResolutionLogic:GetScale() * _Constants.GlobalUpscaleSize
	end
	
	local currentStateInfo = info.State[questState]
	table.insert(desc, currentStateInfo)
	if (questState == 1) then
		table.insert(desc, "\n\n")
		---@type QuestDemand
		local completeDemand = _QuestMan.CompleteDemand[questId]
		local items = completeDemand.Item
		local quests = completeDemand.Quest
		local mobs = completeDemand.Mob
		if (#mobs > 0) then
			if (not _UtilLogic:Contains(currentStateInfo, "#a")) then
				local questInfo = _UserQuestLogic:GetQuestData(cd, questId)
				for i=1,#mobs do
					local mob = mobs[i]
					local count = _QuestDemandCheck:GetMobCount(questInfo, i)
					table.insert(desc, string.format("#o%d#  #r%d/%d#k\n", mob.id, count, mob.count))
				end
				table.insert(desc, "\n")
			end
		end
		if (#items > 0) then
			if (not _UtilLogic:Contains(currentStateInfo, "#c")) then
				for i=1,#items do
					local item = items[i]
					table.insert(desc, string.format("#v%d##t%d# #b#c%d#/%d#k\n", item.id, item.id, item.id, item.count))
				end
				table.insert(desc, "\n")
			end
		end
		if (#quests > 0) then
			for i=1,#quests do
				local quest = quests[i]
				local stateString = ""
				local checkState = _UserQuestLogic:GetQuestState(cd, quest.id)
				if (checkState == 2) then
					stateString = "완료"
				elseif (checkState == 1) then
					stateString = "진행중"
				elseif (checkState == 0) then
					stateString = "시작안함"
				end
				table.insert(desc, string.format("%s #b(%s)#k\n", _QuestMan.QuestName[questId] or "", stateString))
			end
			table.insert(desc, "\n")
		end
	end
	if (questState == 1) then
		self.Text.DefaultColor = Color.black
	else
		self.Text.DefaultColor = Color(0.4,0.4,0.4)
	end
	self.Text:SetText(table.concat(desc), false)
	self.BtGiveUp:SetInteractible(questState == 1)
end
end