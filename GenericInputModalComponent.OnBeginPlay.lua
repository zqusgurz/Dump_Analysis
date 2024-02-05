return function (self) 
self.TextInput.Entity:ConnectEvent(TextInputSubmitEvent, function(event)
	if (not self.Entity.Enable) then
		return true
	end
	---@type TextInputSubmitEvent
	local ev = event
    if (self.callback == nil or not self.callback(1, ev.Text)) then
        local m = self.Entity.Parent.ModalManComponent
	    m:Release(self.ReleasePool, self.Entity)
    end
	_InputManager.LastSubmittedTextInput = _UtilLogic.ElapsedSeconds
end)
end