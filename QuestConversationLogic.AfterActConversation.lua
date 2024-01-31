return function (self,npc,id,newState) 
-- Check Next Quest
if (newState == 2) then
	---@type QuestAct
	local completeAct = _QuestMan.CompleteAct[id]
	if (completeAct ~= nil and completeAct.NextQuest > 0) then
		local nextQuest = completeAct.NextQuest
		if (_UserQuestLogic:GetQuestState(_UserService.LocalPlayer.WsCharacterData, nextQuest) == 0) then
			local newQuestState = self:NewState(npc, nextQuest, false)
			self:BeginConversation(newQuestState)
			return
		end
	end
end

local state = self:NewState(npc, id, true)
if (newState == -1) then
	-- OnLostItem
	self:MakeMessages(state, self:GetMessageByPath(state, "1/lost/yes"), false)
else
	-- AfterAct (Normal)
	self:MakeMessages(state, self:GetMessageByPath(state, string.format("%d/yes", newState-1)), false)
end
self:SendMessage(state)
end