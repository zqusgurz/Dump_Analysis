return function (self,itemId) 
local cd = _UserService.LocalPlayer.WsCharacterData
local quests = _QuestMan.DemandQuestItems[itemId]
if (quests == nil) then
	return
end
for i=1,#quests do
	local questId = quests[i]
	local questState = _UserQuestLogic:GetQuestState(cd, questId)
	if (questState == 1) then
		self:CheckSingleQuestForDemand(cd, questId, questState, false, false)	
	end
end
end