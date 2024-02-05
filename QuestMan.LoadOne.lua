return function (self,id,act,demand,info) 
if (act ~= nil) then
	self.StartAct[id] = self:LoadAct(id, act["0"])
	self.CompleteAct[id] = self:LoadAct(id, act["1"])
end
if (demand ~= nil) then
	local s = self:LoadDemand(id, demand["0"])
	self:AddNpcToQuest(s.Npc, id, 0)
	if (s.Interval >= 0 or s.DayByDay) then
		self.IntervalQuest[id] = true
	end
	self.StartDemand[id] = s
	
	local c = self:LoadDemand(id, demand["1"])
	local cItems = c.Item
	for i=1,#cItems do
		local cItem = cItems[i]
		local questItemList = self.OnlyQuestItem[cItem.id]
		if (questItemList == nil) then
			questItemList = {}
			self.OnlyQuestItem[cItem.id] = questItemList
		end
		questItemList[#questItemList + 1] = { quest=id, count=cItem.count }
		
		local demandQuestItems = self.DemandQuestItems[cItem.id]
		if (demandQuestItems == nil) then
			demandQuestItems = {}
			self.DemandQuestItems[cItem.id] = demandQuestItems
		end
		demandQuestItems[#demandQuestItems + 1] = id
	end
	local cMobs = c.Mob
	for i=1,#cMobs do
		local cMob = cMobs[i]
		local mobQuestList = self.MobQuest[cMob.id]
		if (mobQuestList == nil) then
			mobQuestList = {}
			self.MobQuest[cMob.id] = mobQuestList
		end
		mobQuestList[#mobQuestList+1] = { quest=id, count=cMob.count }
	end
	if (c.Npc == 0) then
		c.Npc = s.Npc
	end
	self:AddNpcToQuest(c.Npc, id, 1)
	self.CompleteDemand[id] = c
end
if (info ~= nil) then
	local n = self:LoadInfo(id, info)
	local p = n.Parent
	if (not _UtilLogic:IsNilorEmptyString(p)) then
		self.SeriesQuest[id] = p
		local order = self.SeriesQuestMaxOrder[p] or 0
		if (order < n.Order) then
			self.SeriesQuestMaxOrder[p] = n.Order
		end
		local seriesQuest = self.SeriesQuestList[p]
		if (seriesQuest == nil) then
			seriesQuest = {}
			self.SeriesQuestList[p] = seriesQuest
		end
		seriesQuest[n.Order] = id
	end
	self.QuestName[id] = n.Name
	if (n.AutoStart) then
		self.AutoStart[id] = true
	end
	if (n.AutoPreComplete) then
		self.AutoPreComplete[id] = true	
	end
	
	local areas = self.AreaToQuest[n.Area]
	if (areas == nil) then
		areas = {}
		self.AreaToQuest[n.Area] = areas
	end
	areas[#areas + 1] = id
	
	self.Info[id] = n
end
end