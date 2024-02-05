return function (self,event) 
if (not _InputUtils:IsTouch(event.TouchId)) then
	self:_OnHandleUITouchExitEvent(event)
end
end