return function (self,event) 
self.__ControlWindowComponent__.HandleInvokeFunctionEvent(self, event)
if (event.Function == "Hide") then
	_QuestMan:SendEvent(ChangedSelectedQuestEntryEvent(nil, self.CurrentTab))
elseif (event.Function == "GiveUp") then
	local selected = self.SelectedQuestEntry
	if (selected ~= nil) then
		local user = _UserService.LocalPlayer
		local qid = selected.QuestEntryComponent.QuestId
		if (_UserQuestLogic:GetQuestState(user.WsCharacterData, qid) ~= 1) then
			return
		end
		_UtilDlgLogic:YesNo("정말 포기하시겠습니까?", function()
			_QuestHandler:TryGiveUpQuest(user, qid)
		end, nil)
	end
end
end