return function (self,template,currentState,type) 
---@type ReactorTemplateState
local templateState = template.States[currentState]
for _,v in templateState.Events do
	---@type ReactorTemplateStateEvent
	local event = v
	if (event.Type == type) then
		return event.State
	end
end
return -1
end