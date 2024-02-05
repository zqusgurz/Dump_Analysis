return function (self,state) 
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
local id = state.QuestId
_QuestMan:EnsureLoadSay(id)
local currentState = state.QuestState
if (currentState == 0) then
	---@type QuestDemand
	local startDemand = _QuestMan.StartDemand[id]
	if (not _UtilLogic:IsNilorEmptyString(startDemand.StartScript)) then
		self:OnFinishConversation(state, 1)
		return
	end
	self:MakeMessages(state, self:GetMessageByPath(state, "0"), false)
elseif (currentState == 1) then
	---@type QuestDemand
	local completeDemand = _QuestMan.CompleteDemand[id]
	---@type integer
	local checkResult
	
	if (completeDemand.Npc == state.Npc) then
		checkResult = _QuestDemandCheck:Check(cd, id, 1)
	else
		if (_QuestDemandCheck:HasLostItem(cd, id)) then
			state.Lost = true
		else		
			checkResult = _QuestCheckResult.Npc
		end
	end
	
	if (state.Lost) then
		self:MakeMessages(state, self:GetMessageByPath(state, "1/lost"), false)
	elseif (checkResult == _QuestCheckResult.Item) then
		self:MakeMessages(state, self:GetMessageByPath(state, "1/stop/item"), false)
		state.Stop = true
	elseif (checkResult == _QuestCheckResult.Mob) then
		self:MakeMessages(state, self:GetMessageByPath(state, "1/stop/mob"), false)
		state.Stop = true
	elseif (checkResult == _QuestCheckResult.Quest) then
		self:MakeMessages(state, self:GetMessageByPath(state, "1/stop/quest"), false)
		state.Stop = true
	elseif (checkResult == _QuestCheckResult.Npc) then
		self:MakeMessages(state, self:GetMessageByPath(state, "1/stop/npc"), false)
		state.Stop = true
	elseif (checkResult ~= _QuestCheckResult.Success) then
		self:MakeMessages(state, nil, false)
		state.Stop = true
	else
		if (not _UtilLogic:IsNilorEmptyString(completeDemand.EndScript)) then
			self:OnFinishConversation(state, 1)
			return
		end
		self:MakeMessages(state, self:GetMessageByPath(state, "1"), false)
	end
end
self:SendMessage(state)
end