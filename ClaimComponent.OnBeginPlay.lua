return function (self) 
_EntityService:GetEntityByPath("/ui/OptionGroup/Claim/BtOk"):ConnectEvent(ButtonClickEvent, function()
	self:OnSubmit()
end)
self.ReportType.Entity:ConnectEvent(ComboboxChangedSelectionEvent, function(e)
	---@type ComboboxChangedSelectionEvent
	local event = e
	if (event.SelectedIndex == 6) then
		self.TargetName.Selection = self.MapCharacterNames		
	else
		self.TargetName.Selection = table.concat(_ClaimLogic:GetChatLogCharacterNames(self.Logs), ",")
	end
	self.TargetName:Refresh(true)
end)
end