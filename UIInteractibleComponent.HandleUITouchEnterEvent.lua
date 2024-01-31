return function (self,event) 
if (not _InputUtils:IsTouch(event.TouchId)) then
	self:_OnHandleUITouchEnterEvent(event)
end
end