return function (self) 
self.MouseOverRect:ConnectEvent(UITouchEnterEvent, function(event)
	if (not _InputUtils:IsTouch(event.TouchId)) then
		if (isvalid(self.Dot)) then
			self.Dot.RichGlyphComponent:ChangeListMasterState(true)
		end
	end
end)
self.MouseOverRect:ConnectEvent(UITouchExitEvent, function(event)
	if (not _InputUtils:IsTouch(event.TouchId)) then
		if (isvalid(self.Dot)) then
			self.Dot.RichGlyphComponent:ChangeListMasterState(false)
		end
	end
end)
self.MouseOverRect:ConnectEvent(UITouchDownEvent, function(event)
	local TouchId = event.TouchId
	if (_InputUtils:IsPrimaryButton(TouchId)) then
		if (self.Handler ~= nil) then
			self.Handler()
		end
	end
end)
end