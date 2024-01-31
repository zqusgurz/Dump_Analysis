return function (self,state,muteAlarm) 
local user = _UserService.LocalPlayer
local currentMapLifePool = user.CurrentMap.LifePoolComponent
local cd = user.WsCharacterData
local toCheckQuests = {}

if (state == -1 or state == 0) then
	-- 현재 맵의 엔피시의 퀘스트들
	for _,n in pairs(currentMapLifePool.Npcs) do
		---@type NpcComponent
		local npc = n
		local npcQuests = _QuestMan.NpcToQuest[npc.NpcTemplateID]
		if (npcQuests ~= nil) then
			for i=1,#npcQuests do
				local id = npcQuests[i]
				if (_QuestMan.IntervalQuest[id] and cd.QuestCompleted[id]) then
					toCheckQuests[id] = 2
				elseif (not cd.QuestStarted[id]) then
					toCheckQuests[id] = 0
				end
			end
		end
	end
	
	-- 자동 시작 가능 퀘스트
	local autoStarts = _QuestMan.AutoStart
	for id,_ in pairs(autoStarts) do
		if (_QuestMan.IntervalQuest[id] and cd.QuestCompleted[id]) then
			toCheckQuests[id] = 2
		elseif (not cd.QuestStarted[id]) then
			toCheckQuests[id] = 0
		end
	end
end

if (state == -1 or state == 1) then
	-- 현재 진행중인 퀘스트들
	for id,_ in pairs(cd.QuestStarted) do
		if (_QuestMan.Info[id]) then
			toCheckQuests[id] = 1
		end
	end
end

for id,currentQuestState in pairs(toCheckQuests) do
	self:CheckSingleQuestForDemand(cd, id, currentQuestState, false, muteAlarm)
end
end