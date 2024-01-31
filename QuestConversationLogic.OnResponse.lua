return function (self,state,response) 
--log(string.format("OnResponse = %d (messageIndex=%d totalMessages=%d)", response,
--        state.MessageIndex, #state.Messages))
if (response == -1) then
	return
end
if (state.MessageIndex > #state.Messages) then
	self:OnFinishConversation(state, response)
	return
end
if (state.Ask) then
	self:OnProcessAsk(state, response)
	return
end

if (state.HasItemSelection) then
	state.MessageIndex += 1
	state.ItemSelection = response
elseif (response == 1) then
	state.MessageIndex += 1
else
	if (self:IsPressedDeclineAtStart(state, response)) then
		state.Stop = true
		self:MakeMessages(state, self:GetMessageByPath(state, "0/no"), false)
	else
		state.MessageIndex = math.max(state.MessageIndex - 1, 1)
	end
end
self:SendMessage(state)
end