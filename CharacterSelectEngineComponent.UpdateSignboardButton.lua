return function (self) 
if (not self.Disabled) then
	self.CreateButton.FunctionButtonComponent:SetInteractible(true)
	for i=1,self.Max do
		---@type Entity
		local entity = self.Entries[i]
		local entry = entity.CharacterSelectEntryComponent
		if (entry.Selected) then
			self.DeleteButton.FunctionButtonComponent:SetInteractible(true)
			self.StartButton.FunctionButtonComponent:SetInteractible(true)
			return
		end
	end
else
	self.CreateButton.FunctionButtonComponent:SetInteractible(false)
end
self.DeleteButton.FunctionButtonComponent:SetInteractible(false)
self.StartButton.FunctionButtonComponent:SetInteractible(false)
-- self.BtIdentify.Enable = _UserService.LocalPlayer.WsUser.Identified
-- self:EnsureIdentifyPopupButtonTarget()
self.BtIdentify.Enable = false -- 인증 기능 삭제
end