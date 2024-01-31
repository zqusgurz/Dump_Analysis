return function (self,cd,questId,state) 
if (not _QuestConstants:IsAvailableQuest(questId)) then
	return _QuestCheckResult.Unknown
end

---@type QuestDemand
local demand = nil
if (state == 0) then
	demand = _QuestMan.StartDemand[questId]
elseif (state == 1) then
	demand = _QuestMan.CompleteDemand[questId]
end
if (demand ~= nil) then
	if (state == 1) then
		local mobs = demand.Mob
		local mobsNum = #mobs
		if (mobsNum > 0) then
			local info = _UserQuestLogic:GetQuestData(cd, questId)
			for i=1,#mobs do
				local count = self:GetMobCount(info, i)
				if (mobs[i].count > count) then
					return _QuestCheckResult.Mob
				end
			end
		end
	end
	local quests = demand.Quest
	local questsNum = #quests
	if (questsNum > 0) then
		for i=1, questsNum do
			local entry = quests[i]
            --log(string.format("[QID:%d] check id=%d  userState=%d  entryState=%d", 
            --        questId, entry.id, _UserQuestLogic:GetQuestState(cd, entry.id), entry.state))
			if (_UserQuestLogic:GetQuestState(cd, entry.id) ~= entry.state) then
				return _QuestCheckResult.Quest
			end
		end
	end
	local pets = demand.Pet
	-- TODO 펫 퀘스트
	if (_TableUtils:GetLength(pets) > 0) then
		return _QuestCheckResult.Pet
	end
	local items = demand.Item
	local itemsNum = #items
	if (itemsNum > 0) then
		for i=1, itemsNum do		
			local entry = items[i]
			local num = _InventoryLogic:GetItemCount(cd, entry.id)
			local count = entry.count
			if (count == 0 and num > 0) then
				return _QuestCheckResult.Item
			end
			if (num < count) then
				return _QuestCheckResult.Item
			end
		end
	end
	if (state == 1) then
		if (not _UtilLogic:IsNilorEmptyString(demand.Info)) then
			local info = cd.QuestStarted[questId]
			if (info ~= demand.Info) then
				return _QuestCheckResult.Info
			end
		end
	end
	-- infoEx, infoNumber는 1.2.41에 없음
	if (state == 0) then
		if (cd.QuestCompleted[questId] ~= nil) then
			if (demand.Interval < 0) then
				if (not demand.DayByDay) then
					return _QuestCheckResult.Time
				end
				if (DateTime.UtcNow < DateTime(cd.QuestCompleted[questId]) + TimeSpan.FromDays(1)) then
					return _QuestCheckResult.Time
				end
			else
				if (DateTime.UtcNow < DateTime(cd.QuestCompleted[questId]) + TimeSpan.FromMinutes(demand.Interval)) then
					return _QuestCheckResult.Time
				end
			end
		end
	end
	if (demand.LvMax ~= 0 and demand.LvMax < cd.Level) then
		return _QuestCheckResult.Level
	end
	if (demand.LvMin ~= 0 and demand.LvMin > cd.Level) then
		return _QuestCheckResult.Level
	end
	if (demand.Pop ~= 0 and demand.Pop > cd.Pop) then
		return _QuestCheckResult.Pop
	end
	if (demand.Start ~= nil and demand.Start > DateTime.UtcNow) then
		return _QuestCheckResult.Time
	end
	if (demand.End ~= nil and demand.End < DateTime.UtcNow) then
		return _QuestCheckResult.Time
	end
	local jobs = demand.Job
	if (#jobs > 0) then
		if (not _TableUtils:Contains(jobs, cd.Job)) then
			return _QuestCheckResult.Job
		end
	end
	local fieldEnters = demand.FieldEnter
	if (#fieldEnters > 0) then
		local mapName = cd.Entity.CurrentMapName:sub(2)
		local mapId = tonumber(mapName)
		if (mapId == nil) then
			return _QuestCheckResult.FieldEnter
		end
		if (not _TableUtils:Contains(fieldEnters, mapId)) then
			return _QuestCheckResult.FieldEnter
		end
	end
end
return _QuestCheckResult.Success
end