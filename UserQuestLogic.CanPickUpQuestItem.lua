return function (self,cd,itemId,questId) 
local demandItemQuests = _QuestMan.OnlyQuestItem[itemId]
if (demandItemQuests == nil) then
	return
end
for i=1,#demandItemQuests do
	local demandItemQuest = demandItemQuests[i]
	local quest = demandItemQuest.quest
	if (questId ~= nil and questId ~= quest) then
		continue
	end
	local count = demandItemQuest.count
	if (_UserQuestLogic:GetQuestState(cd, quest) == 1) then
		if (_InventoryLogic:GetItemCount(cd, itemId) < count) then
			return true
		end
	end
end
return false
end