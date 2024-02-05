return function (self,state,speeches,needFallback) 
state.Messages = {}
state.MessageIndex = 1
if (speeches ~= nil) then
	for i,speech in _WzUtils:GetLabeled(speeches) do
		state.Messages[i+1] = speech
	end
	state.Ask = _WzUtils:GetBool(speeches["ask"], false)
end
-- fallback?
if (needFallback) then
	if (#state.Messages == 0) then
		state.Messages[1] = ""
		state.Ask = false
	end
end
end