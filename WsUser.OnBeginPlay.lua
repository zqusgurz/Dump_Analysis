return function (self) 
if (self:IsClient()) then
	if (_UserService.LocalPlayer.Id ~= self.Entity.Id) then
		local ctrlMan = _AppService:Get().ControlWindowMan
		ctrlMan.MaxMap.MiniMapComponent:OnEnterOtherPlayer(self.Entity)
		ctrlMan.MinMap.MiniMapComponent:OnEnterOtherPlayer(self.Entity)
	else	
		self.Entity.PlayerOptionComponent:RequestLoadOption()
		self:SetMobileMode(Environment:IsMobilePlatform())
	end
else
	self.Entity:AddComponent(AntiHackComponent)
end
self.ColliderOffset = self.Entity.TriggerComponent.ColliderOffset:Clone()
end