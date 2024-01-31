return function (self,state,response) 
if (state.MessageIndex < #state.Messages) then
	local root = self:GetMessageByPath(state, string.format("%d/stop/%d", state.QuestState, state.MessageIndex-1))
	local answer = root["answer"]-1
	if (response ~= answer) then
		state.Ask = false
		state.Stop = true
		state.MessageIndex = 1
		state.Messages = {root[tostring(response)]}
		self:SendMessage(state)
		return
	end
	state.MessageIndex += 1
end
self:SendMessage(state)
end