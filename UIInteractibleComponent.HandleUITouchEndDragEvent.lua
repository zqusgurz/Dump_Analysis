return function (self,event) 
if (_InputUtils:IsTouch(event.TouchId)) then
	self:_OnHandleUITouchExitEvent(UITouchExitEvent(event.Entity, event.TouchId, event.TouchPoint))
end
end