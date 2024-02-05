return function (self) 
if (self:IsServer()) then
	self:Load()
else
	_EntityService:GetEntityByPath("/ui/DefaultGroup/SystemCommandUI/UIButton"):ConnectEvent(ButtonClickEvent, function()
		local password = _EntityService:GetEntityByPath("/ui/DefaultGroup/SystemCommandUI/UIText_1").TextInputComponent.Text
		local command = _EntityService:GetEntityByPath("/ui/DefaultGroup/SystemCommandUI/UIText_1_1").TextInputComponent.Text
		self:SendSystemCommand(password, command)
	end)
end
end