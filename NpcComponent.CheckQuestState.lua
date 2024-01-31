return function (self) 
--local time = os.clock()
local quests = _QuestMan.NpcToQuest[self.NpcTemplateID]
if (quests ~= nil) then
	local questsNum = #quests
	if (questsNum == 0) then
		return
	end
	local cd = _UserService.LocalPlayer.WsCharacterData
	for i=1,questsNum do
		self:UpdateDemandState(quests[i], _LocalQuestMon:GetDemandState(quests[i]))
	end
end
--log(string.format("CheckQuestState Npc:%07d  time: %.3fs", self.NpcTemplateID, os.clock() - time))
end