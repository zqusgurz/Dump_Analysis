return function (self,state,response) 
if (state.Stop) then
	return
end
if (state.Lost) then
	_QuestHandler:OnLostItem(_UserService.LocalPlayer, state.Npc, state.QuestId)
	return
end
if (state.QuestState == 1) then
	local itemSelection = -1
	if (state.HasItemSelection) then
		itemSelection = state.ItemSelection
		log(string.format("selection=%d response=%d", itemSelection, response))
	end
	_QuestHandler:TryCompleteQuest(_UserService.LocalPlayer, state.Npc, state.QuestId, itemSelection)
else
	_QuestHandler:TryStartQuest(_UserService.LocalPlayer, state.Npc, state.QuestId)
end
end