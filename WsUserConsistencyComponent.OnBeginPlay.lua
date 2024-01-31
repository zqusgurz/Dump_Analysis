return function (self) 
if (self:IsClient()) then
	log(string.format("User entered in current map: %s / ins: %s", self.Entity.OwnerId, _WorldInstanceService.WorldInstanceId))
	if (self.Entity.OwnerId == _UserService.LocalPlayer.OwnerId) then
		self:TryLoadFromDifferentChannel()
	end
else
	self:OnBeginPlay_Server()
end
end