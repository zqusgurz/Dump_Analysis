return function (self,entity) 
entity:ConnectEvent(UITouchEnterEvent, function(event)
	if (not _InputUtils:IsTouch(event.TouchId)) then
		self:_OnHandleUITouchEnterEvent(event)
	end
end)
entity:ConnectEvent(UITouchExitEvent, function(event)
	if (not _InputUtils:IsTouch(event.TouchId)) then
		self:_OnHandleUITouchExitEvent(event)
	end
end)
entity:ConnectEvent(UITouchBeginDragEvent, function(event)
	if (_InputUtils:IsTouch(event.TouchId)) then
		self:_OnHandleUITouchEnterEvent(event)
	end
end)
entity:ConnectEvent(UITouchEndDragEvent, function(event)
	if (_InputUtils:IsTouch(event.TouchId)) then
		self:_OnHandleUITouchExitEvent(event)
	end
end)
end