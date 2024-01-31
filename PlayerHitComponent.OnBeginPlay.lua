return function (self) 
self._T.BodyAttackMobs = {}
if (self:IsServer()) then
	self:OnBeginPlay_Server()
end
end