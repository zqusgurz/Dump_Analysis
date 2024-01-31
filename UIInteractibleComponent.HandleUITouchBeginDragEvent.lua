return function (self,event) 
if (_InputUtils:IsTouch(event.TouchId)) then
	self:_OnHandleUITouchEnterEvent(UITouchEnterEvent(event.Entity, event.TouchId, event.TouchPoint))
end
end