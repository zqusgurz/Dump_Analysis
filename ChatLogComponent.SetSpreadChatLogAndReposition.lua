return function (self,spread) 
self.SpreadChatLog = spread
if (spread) then
	self.Entity_MinButton.Enable = true
	self.Entity_MaxButton.Enable = false
	if (_DebugConstants:IsMobile()) then
		self.MobilePlaceholder.Enable = true
		self.MobileSpreadLayer.Enable = false
	else
		self.ChatResizeHandle.Enable = true
	end
else
	self.Entity_MinButton.Enable = false
	self.Entity_MaxButton.Enable = true
	if (_DebugConstants:IsMobile()) then
		self.MobilePlaceholder.Enable = false
		self.MobileSpreadLayer.Enable = true
	else
		self.ChatResizeHandle.Enable = false
	end
end
self:RepositionChatLog()
end