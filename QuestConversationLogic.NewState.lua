return function (self,npc,id,afterAct) 
---@type QuestConversationState
local state = {}
state.QuestId = id
state.Messages = {}
state.MessageIndex = 1
state.Npc = npc
state.Ask = false
state.Stop = afterAct
state.HasItemSelection = false
state.ItemSelection = -1
state.QuestState = _UserQuestLogic:GetQuestState(_UserService.LocalPlayer.WsCharacterData, id)
if (state.QuestState == 2) then
	state.QuestState = 0
end
return state
end