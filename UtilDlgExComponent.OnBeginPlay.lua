return function (self) 
self.Scrollbar:OnCreate()
self.Scrollbar.Entity.Enable = false
self.ScrollView.Entity:ConnectEvent(UITouchDownEvent, function()
	self.TextContent.ScriptTextComponent:DisplayAllNow()		
end)
end