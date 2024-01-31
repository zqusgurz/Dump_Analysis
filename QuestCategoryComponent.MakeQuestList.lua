return function (self) 
local areas = _QuestMan.AreaToQuest[self.Area]
local cd = _UserService.LocalPlayer.WsCharacterData
local quests = {}
local k = 0
if (areas ~= nil) then
	for i=1,#areas do
		local questId = areas[i]
		local tabState = self.QuestState
		if (tabState == 0) then
			if (not _QuestConstants:IsAvailableQuest(questId)) then
				continue
			end
		end
		
		--[[
			1. 연속 퀘스트
				- 시작가능 탭
					- 이 퀘스트의 Order가 1이고, 시작이 안되었을때
				- 완료 탭
					- 이 퀘스트의 Order가 MaxStep과 같고, 완료되었을때
				- 진행중 탭
		            - 자기보다 높은 Order의 다른 연속 퀘스트가 시작이 안되었고,
		            - 이 퀘스트가 진행중 또는 완료일때.
			2. 일반 퀘스트
				- 시작가능 탭
					- 이 퀘스트가 시작되지 않았을 때
				- 완료 탭
					- 이 퀘스트가 완료되었을 때
				- 진행중 탭
					- 이 퀘스트가 진행중일때
		]]

		local questState = _UserQuestLogic:GetQuestState(cd, questId)
		local series = _QuestMan.SeriesQuest[questId]
		if (series) then
			---@type QuestInfo
			local info = _QuestMan.Info[questId]
			if (tabState == 0) then
				if (info.Order ~= 1) then
					continue
				end
				if (questState == 0) then
					if (_QuestDemandCheck:Check(cd, questId, 0) == _QuestCheckResult.Success) then
						quests[k+1] = questId
						k += 1
					end
				end
			elseif (tabState == 2) then
				if (info.Order ~= _QuestMan.SeriesQuestMaxOrder[series]) then
					continue
				end
				if (questState == 2) then
					quests[k+1] = questId
					k += 1
				end
			else
				local max = _QuestMan.SeriesQuestMaxOrder[series]
				if (questState == 0) then
					continue
				end
				if (info.Order == max and questState == 2) then
					continue
				end
				local list = _QuestMan.SeriesQuestList[series]
				for i=info.Order+1,max do
					if (_UserQuestLogic:GetQuestState(cd, list[i]) ~= 0) then
						goto CONTINUE	
					end
				end
				quests[k+1] = questId
				k += 1
				::CONTINUE::
			end
		else
			if (questState == tabState) then
				if (questState == 0) then
					if (_QuestDemandCheck:Check(cd, questId, 0) ~= _QuestCheckResult.Success) then
						continue
					end
				end
				quests[k+1] = questId
				k += 1
			end
		end
	end
end
self.QuestIds = quests
end